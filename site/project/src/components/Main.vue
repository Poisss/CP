<script>
export default{
    data() {
        return {
            slider:[{title:'Хочешь перекусить?',img:'/src/assets/img/img4.jpg',search:'Рестораны',category:'Рестрораны'},
                    {title:'Хочешь арендовать машину?',img:'/src/assets/img/img3.jpg',search:'Машины',category:'Машины'},
                    {title:'Не знаешь, где переночевать?',img:'/src/assets/img/img5.jpg',search:'Отели',category:'Отели'},
                    {title:'Любишь животных?',img:'/src/assets/img/img6.jpg',search:'Животные',category:'Животные'}],
            slider_index:0,
            sliderInterval: null,
            sliderIntervalHeight:null,
            category_more_click: false,
            sliderHeight:[0,0,0,0],
            activity_card_click:12,
            category_card:[{title:'Рестораны',img:'/src/assets/icon/restaurants.png'},{title:'Покупки',img:'/src/assets/icon/gift.svg'},
                            {title:'Ночные развлечения',img:'/src/assets/icon/moon1.svg'},{title:'Активная жизнь',img:'/src/assets/icon/active.svg'},
                            {title:'Красота',img:'/src/assets/icon/salon.svg'},{title:'Автомобили',img:'/src/assets/icon/auto_services.png'},
                            {title:'Домашние услуги',img:'/src/assets/icon/house.svg'},],
            category_card_more:[{title:'Животные',img:'/src/assets/icon/pet.svg'},{title:'Природа',img:'/src/assets/icon/forest.svg'},
                                {title:'Отели',img:'/src/assets/icon/bed.svg'},{title:'Еда',img:'/src/assets/icon/eat.svg'},
                                {title:'Услуги',img:''},{title:'Мероприятии',img:''},
                                {title:'Государственные услуги',img:'/src/assets/icon/public.svg'},{title:'Медицина',img:'/src/assets/icon/hospital.svg'},],
            activity_card:[{user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'3',product_id:'c00',product_title:'Мак',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'5',product_id:'c01',product_title:'Киевси',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'5',product_id:'c01',product_title:'Киевси',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'5',product_id:'c01',product_title:'Киевси',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'5',product_id:'c01',product_title:'Киевси',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'5',product_id:'c01',product_title:'Киевси',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'3',product_id:'c00',product_title:'Мак',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'5',product_id:'c01',product_title:'Киевси',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'5',product_id:'c01',product_title:'Киевси',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'5',product_id:'c01',product_title:'Киевси',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'5',product_id:'c01',product_title:'Киевси',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'5',product_id:'c01',product_title:'Киевси',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'3',product_id:'c00',product_title:'Мак',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'5',product_id:'c01',product_title:'Киевси',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'5',product_id:'c01',product_title:'Киевси',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'5',product_id:'c01',product_title:'Киевси',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'5',product_id:'c01',product_title:'Киевси',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'5',product_id:'c01',product_title:'Киевси',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'3',product_id:'c00',product_title:'Мак',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'5',product_id:'c01',product_title:'Киевси',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'5',product_id:'c01',product_title:'Киевси',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'5',product_id:'c01',product_title:'Киевси',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'5',product_id:'c01',product_title:'Киевси',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'5',product_id:'c01',product_title:'Киевси',product_img:'/src/assets/img/img1.jpg'},
                            {user_id:'ccd1',user_name:'Артём',user_name_last:'Аверин',user_img:'/src/assets/img/img2.jpg',user_comment_text:'привет мир привет мир привет мир привет мир привет мир',user_grade:'3',product_id:'c00',product_title:'Мак',product_img:'/src/assets/img/img1.jpg'},],
            first_activity_card:[]                                                                
        }
    },
    mounted(){
        if(this.slider_index==0){
            this.sliderHeight[0]=90;  
            this.sliderHeight[1]=0;
            this.sliderHeight[2]=0;
            this.sliderHeight[3]=0;
        }    
        this.sliderMountedInterval();
        this.first_activity_card=this.activity_card.slice(0,this.activity_card_click)
    },
    beforeDestroy() {
        clearInterval(this.sliderInterval);
    },
    methods:{
        activityBlockIf(){
            if(this.activity_card_click<this.activity_card.length){
                return true
            }
            else{
                return false
            }
        },
        moreClick(){
            this.activity_card_click+=12;
            this.first_activity_card=this.activity_card.slice(0,this.activity_card_click)
        },
        sliderMountedInterval(){
            this.sliderInterval=setInterval(() => {
            this.sliderMounted(); 
            },6000)
        },
        sliderMounted(){  
            if (this.slider_index < 3) {
                this.slider_index++;
            } else {
                this.slider_index = 0;
            }
            if(this.slider_index==0){
                this.sliderHeight[0]=90;
                this.sliderHeight[1]=0;
                this.sliderHeight[2]=0;
                this.sliderHeight[3]=0;
            }
            if(this.slider_index==1){
                this.sliderHeight[0]=90;
                this.sliderHeight[1]=90;
                this.sliderHeight[2]=0;
                this.sliderHeight[3]=0;
            }
            if(this.slider_index==2){
                this.sliderHeight[0]=90;
                this.sliderHeight[1]=90;
                this.sliderHeight[2]=90;
                this.sliderHeight[3]=0;
            }
            if(this.slider_index==3){
                this.sliderHeight[0]=90;
                this.sliderHeight[1]=90;
                this.sliderHeight[2]=90;
                this.sliderHeight[3]=90;
            }   
            
        },
        sliderChange(x){
            this.slider_index=x;
            clearInterval(this.sliderInterval);
            this.sliderMountedInterval(); 
            if(this.slider_index==0){
                this.sliderHeight[0]=90;
                this.sliderHeight[1]=0;
                this.sliderHeight[2]=0;
                this.sliderHeight[3]=0;
            }
            if(this.slider_index==1){
                this.sliderHeight[0]=90;
                this.sliderHeight[1]=90;
                this.sliderHeight[2]=0;
                this.sliderHeight[3]=0;
            }
            if(this.slider_index==2){
                this.sliderHeight[0]=90;
                this.sliderHeight[1]=90;
                this.sliderHeight[2]=90;
                this.sliderHeight[3]=0;
            }
            if(this.slider_index==3){
                this.sliderHeight[0]=90;
                this.sliderHeight[1]=90;
                this.sliderHeight[2]=90;
                this.sliderHeight[3]=90;
            } 
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
    <div class="block-main">
        <div class="main">
            <div class="slider" :style="{ backgroundImage: `url(${slider[slider_index].img})` }">
                <div class="field field_slider">
                    <div class="slider_menu">
                        <div class="slider_menu_block" @click="sliderChange(0)">
                            <div class="slider_menu_block_active" :style="{'height': sliderHeight[0] + 'px'}">
                                
                            </div>
                        </div>
                        <div class="slider_menu_block" @click="sliderChange(1)">
                            <div class="slider_menu_block_active" :style="{'height': sliderHeight[1] + 'px'}">
                                
                            </div>
                        </div>
                        <div class="slider_menu_block" @click="sliderChange(2)">
                            <div class="slider_menu_block_active" :style="{'height': sliderHeight[2] + 'px'}">
                                
                            </div>
                        </div>
                        <div class="slider_menu_block" @click="sliderChange(3)">
                            <div class="slider_menu_block_active" :style="{'height': sliderHeight[3] + 'px'}">
                                
                            </div>
                        </div>
                    </div>
                    <div>
                        <h1 class="slider_title">
                            {{ slider[slider_index].title }}
                        </h1>
                        <div class="slider_button">
                            <div class="slider_button_img">
                                
                            </div>
                            <router-link :to="{name:'Catalog',query:{category:slider[slider_index].category,find_loc:location}}" class="slider_button_text">
                                {{ slider[slider_index].search }}
                            </router-link>
                        </div>
                    </div>
                </div>
            </div>
            <div class="field">
                <h2 class="title-block">
                    Недавняя активность
                </h2>
                <div class="activity">
                    <div class="activity-block" v-for="card in first_activity_card">
                        <div class="activity-block-header">
                            <router-link :to="{name:'profileView',query:{userid:card.user_id}}" class="activity-block-header-img">
                                <img :src="card.user_img" alt="">
                            </router-link>
                            <div class="activity-block-header-name">
                                <router-link :to="{name:'profileView',query:{userid:card.user_id}}" class="activity-block-header-name-text">
                                    {{ card.user_name }} {{ card.user_name_last.slice(0, 1) }}.
                                </router-link>
                            </div>
                        </div>
                        <div class="activity-block-main">
                            <div  class="activity-block-main-img">
                                <img :src="card.product_img" alt="">
                            </div>
                            <div class="activity-block-main-content">
                                <router-link :to="{name:'Product',query:{product_id:card.product_id}}"  class="activity-block-main-title">
                                    {{ card.product_title }}
                                </router-link>
                                <div  class="activity-block-main-grade">
                                    <div  class="activity-block-main-grade_img">
                                        <img :src="gradeMethods1(card.user_grade)" alt="">
                                    </div>
                                    <div  class="activity-block-main-grade_img">
                                        <img :src="gradeMethods2(card.user_grade)" alt="">
                                    </div>
                                    <div  class="activity-block-main-grade_img">
                                        <img :src="gradeMethods3(card.user_grade)" alt="">
                                    </div>
                                    <div  class="activity-block-main-grade_img">
                                        <img :src="gradeMethods4(card.user_grade)" alt="">
                                    </div>
                                    <div  class="activity-block-main-grade_img">
                                        <img :src="gradeMethods5(card.user_grade)" alt="">
                                    </div>
                                </div>
                                <div class="activity-block-main-text">
                                    {{ card.user_comment_text }}
                                </div>
                            </div>
                        </div>
                        <div class="activity-block-footer">
                            <hr>
                        </div>
                    </div>
                </div>
                <div class="activity-block-more" v-if="activityBlockIf()">
                    <div class="activity-block-more-img">

                    </div>
                    <div class="activity-block-more-text" @click="moreClick()">
                        Показать больше
                    </div> 
                </div>
            </div>
            <hr>
            <div class="field">
                <h2 class="title-block">
                    Категории
                </h2>
                <div class="categories">
                    <router-link v-for="card in category_card"  :to="{name:'Catalog',query:{category:card.title,find_loc:location}}" class="categories-block">
                            <div class="categories-block-img">
                                <img :src="card.img">
                            </div>
                            <div class="categories-block-title">
                                {{ card.title }}
                            </div>
                    </router-link>
                    <div class="categories-block" @click="category_more_click=!category_more_click">
                        <div class="categories-block-img">
                            <img src="../assets/icon/dot.svg" alt="">
                        </div>
                        <div class="categories-block-title">
                            Еще
                        </div>
                    </div>
                </div>
                <div class="categories_more">
                    <router-link v-if="category_more_click" v-for="card in category_card_more"  :to="{name:'Catalog',query:{category:card.title,find_loc:location}}" class="categories_more-block">
                        <div class="categories_more-block-img">
                            <img :src="card.img" alt="">
                        </div>
                        <div class="categories_more-block-title">
                            {{ card.title }}
                        </div>
                    </router-link>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
a{
    color: white;
}
.field{
    max-width: 1200px;
    padding: 40px;
    margin: 0 auto;
}
.block-main{
    width: 100vw;
}
.slider{
    position: relative;
    height: 700px;
    color: white;
    background-position: 50%;
    background-size: cover;
    background-repeat: no-repeat;
}
.field_slider{
    display: grid;
    grid-template-columns: 70px 1fr;
    padding-top: 170px;
}
.slider_title{
    margin-top: 5px;
    max-width: 600px;
}
.slider_button{
    display: inline-block;
    min-width: 100px ;
    background-color: red;
    padding: 15px 30px;
    border-radius: 5px;
    cursor: pointer;
}
.slider_button:active{
    background-color: rgb(184, 1, 1);
}
.slider_button_img{
    display: block;
    float: left;
    width: 20px;
    height: 24px;
    margin-right: 10px;
    background: url("../assets/icon/search.svg") 50%/cover no-repeat;
}
.slider_button_text{
    display: block;
    float: left;
}
.slider_menu{
    display: grid;
    row-gap: 10px;
    width: 13px;
    cursor: pointer;
}
.slider_menu_block{
    background-color: rgb(255, 255, 255,0.5); 
    border-radius: 10px;
    width: 100%;
    height: 90px;
    overflow: hidden;
}
.slider_menu_block_active{
    background-color: rgb(255, 255, 255); 
    width: 100%;
    transition: height 0.5s ease;
}
.title-block{
    text-align: center;
}
hr{
    width: 100%;
    height: 1px;
    background: rgb(128, 128, 128,0.5);
    border: none;
    border-radius: 3px;
}
.activity{
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    grid-template-rows: 370px;
    gap: 50px;
    margin: 50px 0;
}
.activity-block{
    border: 1px solid rgb(128, 128, 128,0.5);
    display: grid;
    grid-template-columns: 1fr;
    grid-template-rows: 1fr 3fr 1fr;

}
.activity-block-header{
    padding: 10px 20px;
    display: grid;
    grid-template-columns: 40px 1fr;
    align-items: center;
}
.activity-block-header-img{
    cursor: pointer;
    height: 40px;
    border-radius: 50%;
    overflow: hidden;
}
.activity-block-header-img img,.activity-block-main-img img,.activity-block-main-grade_img img{
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.activity-block-header-name{
    font-weight: 700;
    padding-left: 20px;
}
.activity-block-header-name-text,.activity-block-main-title{
    display: inline;
    cursor: pointer;
    color: black;
}
.activity-block-header-name-text:hover,.activity-block-main-title:hover{
    text-decoration: underline;
}
.activity-block-main-content,.activity-block-footer{
    padding: 0 25px;
}
.activity-block-main-img{
height: 89px;
margin-bottom: 15px;
}
.activity-block-main-title{
    font-weight: 600;
    color: rgb(2,126,154);
}
.activity-block-main-grade{
    display: grid;
    grid-template-columns: 20px 20px 20px 20px 20px 1fr;
    grid-template-rows: 20px;
    gap: 5px;
    margin: 5px 0;
}
.activity-block-main-text{
    overflow: hidden;
    height: 50px;
}
.activity-block-more{
    display: grid;
    grid-template-columns: 30px 1fr;
    margin: 0 auto;
    margin-bottom: 80px;
    width: 165px;
    cursor: pointer;
}
.activity-block-more:hover .activity-block-more-text{
    text-decoration: underline;
}
.activity-block-more-img{
    background: url("../assets/icon/caret.svg") 50% no-repeat;
}
.activity-block-more-text{
    font-weight: 500;
    color: #027e9a;    
}
.categories{
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr;
    gap: 50px;
}
.categories-block{
    display: grid;
    justify-items: center;
    padding: 48px 0;
    border: 1px solid rgb(128, 128, 128,0.5);
    border-radius: 5px;
}
.categories-block-img{
    margin-bottom: 16px;
    width: 40px;
    height: 45px;
    overflow: hidden;
}
.categories-block-img img{
    display: block;
    width: 40px;
    height: 40px;
}
.categories-block-title{
    text-align: center;
    color: black;
    font-weight: 500;
}
.categories-block:hover{
    box-shadow: 0px 5px 10px 2px rgba(34, 60, 80, 0.2);
}
.categories_more{
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr;
    margin: 50px 0;
    gap: 50px;
}
.categories_more-block{
    display: grid;
    grid-template-columns: 40px 1fr;
    color: black;
    align-items: center;
}
.categories_more-block:hover{
    text-decoration: underline;
}
.categories_more-block-img{
    width: 30px;
    height: 30px;
}
.categories_more-block-img img{
    display: block;
    width: 100%;
    height: 100%;
}
.categories_more-block-title{
    margin-left: 10px;
}

</style>