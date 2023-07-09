<script>
import { useStore } from '../store/store';
export default{
    setup(){
        const Store = useStore()
        const logout = () => {
            Store.success = false;
            Store.role = '';
            Store.name = '';
            Store.name_last = '';
            Store.img='';
            Store.id = '';
            router.push({ name: 'home' })
        }

        return{
            Store,
            logout
        }
    },
    data() {
        return {
            menu_focus:false,
            btn_searc_focus:[false,false],
            location: "Магнитогорск",
            search:"",
            search_history:[],
            search_passive:[{img:'/src/assets/icon/restaurants.png',title:'Рестораны'},{img:'/src/assets/icon/delivery.png',title:'Доставка'},
                            {img:'/src/assets/icon/auto_services.png',title:'Авто ремонт'},{img:'/src/assets/icon/hotel.png',title:'Отели'},
                            {img:'/src/assets/icon/park.png',title:'Парки'},{img:'/src/assets/icon/gym.png',title:'Спортзал'},],
            search_request:[{img:'',title:'Бд запросы'}],
            location_request:[{img:'',title:'Бд запросы'}],
            check_passive:null,
            check_history:null
        }
    },
    mounted() {    
        
    },
    beforeRouteEnter(to, from, next) {
        next(vm => {
            this.search_router();
         vm.myMethod();
       });
    },
    computed:{
        componentNumber() {
        switch (this.$route.name) {
          case 'home': return '1'
          case 'Catalog': return '2'
          case 'SignUp': return '3'
          case 'SignIn': return '3'
          default: return ''
        }
      }
    },
    methods:{
        menu_click(){
            this.menu_focus=!this.menu_focus;
        },
        search_router(){
            switch (this.$route.name) {
            case 'Catalog': return this.search=this.$route.query.find_desc;    
            case 'home': return this.search='';
            default: return this.search='';
            }
        },
        search_enter(x){
            this.btn_searc_focus[x]=false;
            this.$router.push({name:'Catalog',query:{find_desc:this.search,find_loc:this.location}});
        },
        search_click(x){
            this.search=x;
            this.$router.push({name:'Catalog',query:{find_desc:this.search,find_loc:this.location}})
        },
        add_history(x){
            this.check_passive=0;
            this.check_history=0;
            console.log(1);
            if(x.trim()!=''){
                this.search_passive.forEach(passive=>{
                    if(x==passive.title){
                        this.check_passive=1;
                    }
                })
                this.search_history.forEach(passive=>{
                    if(x==passive.title){
                        this.check_history=1;
                    }
                })
                if(this.check_passive==0 && this.check_history==0){
                    if(this.search_history.length<5){
                        this.search_history.unshift({img:'/src/assets/icon/watch.svg',title:x})
                    }
                    else{
                        this.search_history.pop();
                        this.search_history.unshift({img:'/src/assets/icon/watch.svg',title:x})
                    }
                }  
            }
        },
        location_click(x){
            this.location=x;
        }

    }
}
</script>

<template>
    <div class="header" id="header" :style="{position: componentNumber==1?'absolute':componentNumber==2?'fixed':'' ,background: componentNumber==1?'none':'',border:componentNumber==1?'none':'',padding:componentNumber==3?'0':''}">
        <div class="logo">
            <router-link :to="{name:'home'}" class="logo-div">
                <img src="../assets/icon/logo_relp.svg" alt="" width="50">
            </router-link>
        </div>
        <div class="nav" :style="{display:componentNumber==3?'none':''}">
            <div class="nav-grid">
                <div class="btn-search btn-search-one nav-block">
                    <input type="text" v-model="search" @keyup.enter="search_enter(0),add_history(search)" class="nav-block-one" placeholder="Ресторан, отель, коцерт" @focus="btn_searc_focus[0]=true" @blur="btn_searc_focus[0]=false">
                </div>
                <div class="btn-search btn-search-two nav-block">
                    <input type="text" v-model="location" @keyup.enter="search_enter(1),add_history(search)" class="nav-block-two" placeholder="Магнитогорск" @focus="btn_searc_focus[1]=true" @blur="btn_searc_focus[1]=false">
                </div>
            </div>
            
            <router-link  :to="{name:'Catalog',query:{find_desc:search,find_loc:location}}" @mousedown="add_history(search)" class="search nav-block">

            </router-link>
            <div class="select">
                <div class="option option-one" v-if="btn_searc_focus[0]">
                    <div v-if="search.trim()!=''">
                        <router-link v-for="object in search_request" :to="{name:'Catalog',query:{find_desc:object.title,find_loc:location}}" @mousedown.native="search_click(object.title),add_history(object.title)" class="option_value option_value_two">
                            <div class="title title-text">
                                {{ object.title }}
                            </div>
                        </router-link>
                    </div>
                    <div v-if="search.trim()==''">
                        <router-link v-for="object in search_history" :to="{name:'Catalog',query:{find_desc:object.title,find_loc:location}}" @mousedown.native="search_click(object.title)" class="option_value option_value_one">
                            <div class="preview">
                                <img :src="object.img"  alt="">
                            </div>
                            <div class="title">
                                {{ object.title }}
                            </div>
                        </router-link>
                        <router-link v-for="object in search_passive" :to="{name:'Catalog',query:{find_desc:object.title,find_loc:location}}" @mousedown.native="search_click(object.title)" class="option_value option_value_one">
                            <div class="preview">
                                <img :src="object.img"  alt="">
                            </div>
                            <div class="title">
                                {{ object.title }}
                            </div>
                        </router-link>
                    </div>
                </div>
                <div class="option option-two" v-if="btn_searc_focus[1]">
                    <div class="option_value option_value_one">
                        <div class="preview">
                            <img src="../assets/icon/location.png" alt="">
                        </div>
                        <div class="title title-gps">
                            gps{{ componentNumber }}
                        </div>
                    </div>
                    <div v-if="location.trim()!=''">
                        <div v-for="object in location_request" @mousedown="location_click(object.title)" class="option_value option_value_two">
                            <div class="title title-text">
                                {{ object.title }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div v-if="!Store.success" class="login" :style="{display:componentNumber==3?'none':''}">
            <router-link :to="{
                name:'SignUp',
                params:id=1
                }" class="sign signup" :style="{color: componentNumber==1?'white':'',border: componentNumber==1?'1px solid white':''}">
                Регистрация
            </router-link>
            <router-link :to="{
                name:'SignIn',
                query:{id:'1'}
                }" class="sign signin">
                Войти
            </router-link>
        </div>
        <div v-if="Store.success" class="login">
            <div>
                
            </div>
            <div class="activity-block-header-text">
                {{ Store.name }} {{ Store.name_last.slice(0, 1) }}.
            </div>
            <div class="activity-block-header-img-border">
                <div  class="activity-block-header-img" @click="menu_click" @blur="menu_click">
                    <img :src="Store.img" alt="">
                </div>
                <div v-if="menu_focus" class="activity-block-header-img-block">
                    <router-link :to="{name:'profile'}" @click="menu_click" class="activity-block-header-img-block-li">
                        Личные данные
                    </router-link>
                    <router-link :to="{name:'control'}" @click="menu_click" class="activity-block-header-img-block-li">
                        Управление
                    </router-link>
                    <div @click="logout" class="activity-block-header-img-block-li">
                        Выход
                    </div>
                </div>
            </div>
            
            <div>

            </div>
        </div>
    </div>
</template>

<style scoped>
.header{
    z-index: 30;
    width: 100vw;
    top: 0;
    background: white;
    position: relative;
    min-height: 100px;
    border-bottom: 1px solid rgb(128, 128, 128,0.2);
    display: grid;
    grid-template-columns: minmax(200px,1fr) minmax(300px,968px) minmax(300px,1fr);
    padding: 24px 0;
}
.logo{
    position: relative;
}
.logo-div{
    display: flex;
    align-items: center;
    position: absolute;
    top: 0px;
    left: 45px;
    height: 100%;
    cursor: pointer;
}
.logo img{
    display: block;
}
.nav{
    display: grid;
    grid-template-columns: 1fr 40px;
    align-items: center;
    position: relative;
}
.nav-grid{
    display: grid;
    grid-template-columns: 1fr 1fr;
    box-shadow: 0px 5px 18px 0px rgba(34, 60, 80, 0.2);
}
.nav-block{
    height: 40px;
    position: relative;
}
input:focus,input:active {
    border: none;
    outline: none;
}
.btn-search input{
    box-sizing: border-box;
    padding: 0 15px;
    width: 100%;
    height: 100%;
    border: none;
    
}
.nav-block-one{
    border-top-left-radius:5px ;
    border-bottom-left-radius:5px ;
    box-shadow: -14px 5px 10px -15px rgba(34, 60, 80, 0.2);
}
.nav-block-one:focus{
    border-bottom-left-radius:0px ;
}
.nav-block:first-child::before{
    content: " ";
    display: block;
    height: 30px;
    width: 2px;
    border-radius: 5px;
    background: rgb(128, 128, 128,0.3);
    position: absolute;
    top: 5px;
    right: 0px;
}
.search{
    position: relative;
    background: red;
    border-top-right-radius: 5px;
    border-bottom-right-radius:5px ;
    cursor: pointer;
}
.search::before{
    content: url("../assets/icon/search.svg");
    width: 14px;
    height: 14px;
    position: absolute;
    top: 8px;
    left: 7px;
}
.select{
    position: absolute;
    width: 100%;
    top: 70px;
    display: grid;
    grid-template-columns: 1fr 1fr 40px;
    grid-template-areas: "option-one option-two .";
    z-index: 5;
}
.option{
    background: white;
    border-top: 1px solid rgb(128, 128, 128,0.3);
    box-shadow: 0px 5px 18px 0px rgba(34, 60, 80, 0.2);
    border-bottom-left-radius: 5px;
    border-bottom-right-radius: 5px;
}
.option-one{
    grid-area: option-one;
    display: grid;
    grid-template-columns: 1fr;
}
.option-two{
    grid-area: option-two;
}
.option_value:first-child{
    margin-top: 10px;
}
.option_value:last-child{
    margin-bottom: 10px;
}
.option_value{
    display: grid;
    
    margin: 0px 10px;
    padding: 5px;
    height: auto;
    border-radius: 2px;
}
.option_value_one{
    grid-template-columns: 25px 1fr;
}
.option_value_two{
    grid-template-columns: 1fr;
}
.option_value:hover{
    background: rgb(128, 128, 128,0.3);
}
.preview img{
    display: block;
    width: 100%;
    height: auto;
}
.title{
    color: #213547;
    font-size: 15px;
    margin-left: 15px;
    font-weight: normal;
}
.title-gps{
    color: rgb(32,129,208);
}
.title-text{
    margin-left: 0px;
}
.login{
    display: grid;
    grid-template-columns: 1fr 140px 60px 50px;
    grid-template-areas: ". signup signin .";
    justify-items: center;
    align-items: center;
}
.activity-block-header-text{
    display: grid;
    color: white;
    text-shadow: 1px 1px 1px rgba(0,0,0,0.6);
    justify-self: end;
}
.activity-block-header-img-border{
    position: relative;
}
.activity-block-header-img{
    cursor: pointer;
    height: 40px;
    width: 40px;
    border-radius: 50%;
    overflow: hidden;
}
.activity-block-header-img img{
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.activity-block-header-img-block{
    position: absolute;
    display: grid;
    grid-template-columns: 1fr;
    top: 43px;
    right: 0px;
    width: 150px;
    background-color: white;
    border: 1px solid rgb(0, 0, 0,0.4);
    border-radius: 2px;
}
.activity-block-header-img-block-li{
    cursor: pointer;
    padding: 5px;
    color: black;
    font-weight: 400;
}
.activity-block-header-img-block-li:hover{
    background: rgb(128, 128, 128,0.2);
}
.sign{
    
    border-radius: 5px;
    padding: 10px;
    color: white;
}
.signup{
    grid-area: signup;
    border: 1px solid rgb(128, 128, 128,0.2);
    color: black;
}
.signin{
    background-color: red;
    grid-area: signin;
}
</style>