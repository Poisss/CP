<script>
import axios from 'axios';
import { useStore } from '../store/store';
export default{
    setup(){
        const Store = useStore()

        return{
            Store
        }
    },
    data() {
        return {
            user:[],
            review:[]
        }
    },
    mounted() {    
        const userId  = this.$route.query.userid;
        axios.get('http://cp/site/project/php/profileUser.php',{
            params: {
                id: userId
            },
            timeout: 50000,
            headers: {
                'Content-Type': 'application/json',
                'Content-Type': 'application/x-www-form-urlencoded'
            }
        })
        .then(response => { 
            this.user = response.data;
        })
        .catch(error => { console.log(error) })
        axios.get('http://cp/site/project/php/profileReview.php',{
            params: {
                id: userId
            },
            timeout: 50000,
            headers: {
                'Content-Type': 'application/json',
                'Content-Type': 'application/x-www-form-urlencoded'
            }
        })
        .then(response => { 
            this.review = response.data;
        })
        .catch(error => { console.log(error) })
    },
    computed:{
        age() {
            const birthdate = new Date(this.user[0].birthdate);
            const today = new Date();
            
            let age = today.getFullYear() - birthdate.getFullYear();
            const monthDiff = today.getMonth() - birthdate.getMonth();
            
            if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthdate.getDate())) {
            age--;
            }
            
            return age;
        },
        nextuser() {
        // switch (this.$route.name) {
        //   case 'home': return '1'
        //   case 'Catalog': return '2'
        //   case 'SignUp': return '3'
        //   case 'SignIn': return '3'
        //   default: return ''
        // }
      }
    },
    methods:{
        formattedDate(x){
            const [year, month, day] = x.split('-');
            return `${day}/${month}/${year}`;
        },
        gradeMethods1(x){
            if(x==1){
                return "/src/assets/icon/grabe_1.svg"
            }
            else if(x==2){
                return "/src/assets/icon/grabe_2.svg" 
            }
            else if(x==3){
                return "/src/assets/icon/grabe_3.svg"
            }
            else if(x==4){
                return "/src/assets/icon/grabe_4.svg"
            }
            else if(x==5){
                return "/src/assets/icon/grabe_5.svg"
            }
        },
        gradeMethods2(x){
            if(x==2){
                return "/src/assets/icon/grabe_2.svg" 
            }
            else if(x==3){
                return "/src/assets/icon/grabe_3.svg"
            }
            else if(x==4){
                return "/src/assets/icon/grabe_4.svg"
            }
            else if(x==5){
                return "/src/assets/icon/grabe_5.svg"
            }
            else{
                return "/src/assets/icon/grabe_0.svg"
            }
        },
        gradeMethods3(x){
            if(x==3){
                return "/src/assets/icon/grabe_3.svg"
            }
            else if(x==4){
                return "/src/assets/icon/grabe_4.svg"
            }
            else if(x==5){
                return "/src/assets/icon/grabe_5.svg"
            }
            else{
                return "/src/assets/icon/grabe_0.svg"
            }
        },
        gradeMethods4(x){
            if(x==4){
                return "/src/assets/icon/grabe_4.svg"
            }
            else if(x==5){
                return "/src/assets/icon/grabe_5.svg"
            }
            else{
                return "/src/assets/icon/grabe_0.svg"
            }
        },
        gradeMethods5(x){
            if(x==5){
                return "/src/assets/icon/grabe_5.svg"
            }
            else{
                return "/src/assets/icon/grabe_0.svg"
            }
        }

    }
}
</script>

<template>
    <div class="band">

    </div>
    <div v-if="this.user.length!=0" class="field">
        <div class="header">
            <div>
                <div class="header-img-block">
                    <img :src="user[0].img" alt="">
                </div>
            </div>
            <div class="header-text">
                <div>
                    <h2 class="header-text-h2">
                        {{ user[0].name }} {{ user[0].name_last.slice(0, 1) }}.
                    </h2>
                    <p>Пол: {{ user[0].sex.slice(0, 1) }}</p>
                    <p>Возраст: {{ age }}</p>
                    <p>Отзывов: {{ review.length }}</p>
                </div>
                <div v-if="this.$route.query.userid==Store.id">
                    <router-link :to="{name:'profileUp',query:{product_id:Store.id}}" class="main-review-header-title">
                        Редактировать
                    </router-link>
                    
                </div>
            </div>
        </div>
        <div class="main">
            <div>
               <h2>Отзывы</h2>
                <div v-if="this.review.length!=0" v-for="card in review" class="main-review">
                    <div class="main-review-header">
                        <router-link :to="{name:'Product',query:{product_id:card.product_id}}" class="main-review-header-img-block">
                            <img :src="card.img" alt="">
                        </router-link>
                        <div class="main-review-header-title-block">
                            <router-link :to="{name:'Product',query:{product_id:card.product_id}}" class="main-review-header-title">
                                {{ card.title }}
                            </router-link>
                        </div>
                    </div>
                    <div>
                        <div  class="main-grade">
                            <div  class="main-grade_img">
                                <img :src="gradeMethods1(card.grade)" alt="">
                            </div>
                            <div  class="main-grade_img">
                                <img :src="gradeMethods2(card.grade)" alt="">
                            </div>
                            <div  class="main-grade_img">
                                <img :src="gradeMethods3(card.grade)" alt="">
                            </div>
                            <div  class="main-grade_img">
                                <img :src="gradeMethods4(card.grade)" alt="">
                            </div>
                            <div  class="main-grade_img">
                                <img :src="gradeMethods5(card.grade)" alt="">
                            </div>
                            <div>
                                {{  formattedDate(card.date) }}
                            </div>
                        </div>
                    </div>
                    <div>
                        {{ card.text }}
                    </div>
                </div> 
                <div v-else>
                    Пользователь еще не оставлял отзывы
                </div>
            </div>
            <div>

            </div>
        </div>
    </div>
    <div v-else class="end">
        Пользователь не найден
    </div>
</template>

<style scoped>
.band{
    z-index: 1;
    position: absolute;
    background: rgb(128, 128, 128,0.3);
    width: 100%;
    height: 150px;
}
.end{
    display: grid;
    justify-content: center;
    margin-top: 55px;
    color: black;
    font-weight: 600;
}
.field{
    position: relative;
    z-index: 10;
    max-width: 1200px;
    padding: 20px;
    margin: 0 auto;
}
.header{
    display: grid;
    grid-template-columns: 200px 1fr;
}
.header-img-block,.main-review-header-img-block{
    cursor: pointer;
    width: 100%;
    height: 100%;
    border-radius: 5px;
    overflow: hidden;
}
.header-img-block img,.main-review-header-img-block img{
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.header-text{
    display: grid;
    grid-template-columns: 1fr 100px;
    padding: 0 20px;
}
.header-text h2{
    margin: 0px 0;
}
.header-text p{
    margin: 2px 0;
}
.main{
    display: grid;
    grid-template-columns: 1fr 1fr;
}
.main-review:nth-child(2){
    border-top: 1px solid rgb(0, 0, 0,0.2);
}
.main-review{
    border-bottom: 1px solid rgb(0, 0, 0,0.2);
    padding: 10px 0;
}
.main-review-header{
    display: grid;
    grid-template-columns: 50px 1fr;
    margin-bottom: 15px;
}
.main-review-header-img-block{
    height: 50px;
}
.main-review-header-title-block{
    display: grid;
    align-content: center;
}
.main-review-header-title{
    font-weight: 600;
    color: rgb(2,126,154);
    margin-left: 10px;
    margin-top: 10px;
}
.main-review-header-title:hover{
    text-decoration: underline;
}
.main-grade{
    display: grid;
    grid-template-columns: 20px 20px 20px 20px 20px 1fr;
    grid-template-rows: 20px;
    gap: 5px;
    margin: 5px 0;
}
.main-grade_img img{
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
}
</style>