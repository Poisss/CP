<script>
import ChildComponent from './catalogImg.vue';
import ChildOpeningTimes from './catalogOpeningTimes.vue';
export default{  
    components:{
        ChildComponent,
        ChildOpeningTimes
    },
      data() {
          return {
              categoryTag:['Бургеры','Лапша','Сэндвичи','Хот-дог','Суп','Паста','Бобы','Стейк','Плов','Круасан'],
              categoryChange:1,
              category_product:[{product_id:'1',product_title:'Много мяса',product_grade:'5',product_grade_count:'264',product_tag:['Кофе','Чай'],product_img:['/src/assets/img/img4.jpg','/src/assets/img/banner2.jpg','/src/assets/img/banner1.jpg'],openingTimes: [{ day: 'Воскресенье', opening: '10:00', closing: '12:00' },{ day: 'Понедельник', opening: '07:00', closing: '08:00' },{ day: 'Вторник', opening: '09:00', closing: '18:00' },{ day: 'Среда', opening: 'закрыто', closing: 'закрыто' },{ day: 'Четверг', opening: 'открыто', closing: 'открыто' },{ day: 'Пятница', opening: '09:00', closing: '18:00' },{ day: 'Суббота', opening: '08:00', closing: '09:00' },],product_description:'lorem fefeife fefif eifeifiefieij eifiefieif eiefkeif eeef fefeife fefif eifeifiefieij eifiefieif eiefkeif eeef fefeife fefif eifeifiefieij eifiefieif eiefkeif eeef'},
                                {product_id:'2',product_title:'',product_grade:'3',product_grade_count:'744',product_tag:['',''],product_img:['/src/assets/img/banner2.jpg','/src/assets/img/banner1.jpg'],openingTimes: [{ day: 'Воскресенье', opening: 'закрыто', closing: 'закрыто' },{ day: 'Понедельник', opening: '14:00', closing: '18:00' },{ day: 'Вторник', opening: '11:00', closing: '18:00' },{ day: 'Среда', opening: '09:00', closing: '18:00' },{ day: 'Четверг', opening: '09:00', closing: '18:00' },{ day: 'Пятница', opening: '09:00', closing: '18:00' },{ day: 'Суббота', opening: 'открыто', closing: 'открыто' },],product_description:''},
                                {product_id:'3',product_title:'',product_grade:'2',product_grade_count:'416',product_tag:['',''],product_img:['/src/assets/img/banner2.jpg'],openingTimes: [{ day: 'Воскресенье', opening: 'закрыто', closing: 'закрыто' },{ day: 'Понедельник', opening: '10:00', closing: '18:00' },{ day: 'Вторник', opening: 'закрыто', closing: 'закрыто' },{ day: 'Среда', opening: '09:00', closing: '18:00' },{ day: 'Четверг', opening: '09:00', closing: '18:00' },{ day: 'Пятница', opening: '09:00', closing: '18:00' },{ day: 'Суббота', opening: '08:00', closing: '10:00' },],product_description:''},
                                {product_id:'4',product_title:'',product_grade:'5',product_grade_count:'163',product_tag:['',''],product_img:['/src/assets/img/banner1.jpg'],openingTimes: [{ day: 'Воскресенье', opening: '09:00', closing: '14:00' },{ day: 'Понедельник', opening: 'закрыто', closing: 'закрыто' },{ day: 'Вторник', opening: '07:00', closing: '08:00' },{ day: 'Среда', opening: '09:00', closing: '18:00' },{ day: 'Четверг', opening: '09:00', closing: '18:00' },{ day: 'Пятница', opening: '09:00', closing: '18:00' },{ day: 'Суббота', opening: '14:00', closing: '16:00' },],product_description:''},
                                {product_id:'5',product_title:'',product_grade:'4',product_grade_count:'256',product_tag:['',''],product_img:['',''],openingTimes: [{ day: 'Воскресенье', opening: 'закрыто', closing: 'закрыто' },{ day: 'Понедельник', opening: 'закрыто', closing: 'закрыто' },{ day: 'Вторник', opening: 'закрыто', closing: 'закрыто' },{ day: 'Среда', opening: '09:00', closing: '18:00' },{ day: 'Четверг', opening: '09:00', closing: '18:00' },{ day: 'Пятница', opening: '09:00', closing: '18:00' },{ day: 'Суббота', opening: 'закрыто', closing: 'закрыто' },],product_description:''},
                                {product_id:'6',product_title:'',product_grade:'2',product_grade_count:'783',product_tag:['',''],product_img:['',''],openingTimes: [{ day: 'Воскресенье', opening: 'закрыто', closing: 'закрыто' },{ day: 'Понедельник', opening: '09:00', closing: '18:00' },{ day: 'Вторник', opening: '09:00', closing: '18:00' },{ day: 'Среда', opening: '09:00', closing: '18:00' },{ day: 'Четверг', opening: '09:00', closing: '18:00' },{ day: 'Пятница', opening: '09:00', closing: '18:00' },{ day: 'Суббота', opening: '10:00', closing: '16:00' },],product_description:''},
                                {product_id:'7',product_title:'',product_grade:'1',product_grade_count:'345',product_tag:['',''],product_img:['',''],openingTimes: [{ day: 'Воскресенье', opening: 'закрыто', closing: 'закрыто' },{ day: 'Понедельник', opening: '09:00', closing: '18:00' },{ day: 'Вторник', opening: '09:00', closing: '18:00' },{ day: 'Среда', opening: '09:00', closing: '18:00' },{ day: 'Четверг', opening: '09:00', closing: '18:00' },{ day: 'Пятница', opening: '09:00', closing: '18:00' },{ day: 'Суббота', opening: '10:00', closing: '16:00' },],product_description:''},
                                {product_id:'8',product_title:'',product_grade:'5',product_grade_count:'129',product_tag:['',''],product_img:['',''],openingTimes: [{ day: 'Воскресенье', opening: 'закрыто', closing: 'закрыто' },{ day: 'Понедельник', opening: '09:00', closing: '18:00' },{ day: 'Вторник', opening: '09:00', closing: '18:00' },{ day: 'Среда', opening: '09:00', closing: '18:00' },{ day: 'Четверг', opening: '09:00', closing: '18:00' },{ day: 'Пятница', opening: '09:00', closing: '18:00' },{ day: 'Суббота', opening: '10:00', closing: '16:00' },],product_description:''},
                                {product_id:'9',product_title:'',product_grade:'3',product_grade_count:'335',product_tag:['',''],product_img:['',''],openingTimes: [{ day: 'Воскресенье', opening: 'закрыто', closing: 'закрыто' },{ day: 'Понедельник', opening: '09:00', closing: '18:00' },{ day: 'Вторник', opening: '09:00', closing: '18:00' },{ day: 'Среда', opening: '09:00', closing: '18:00' },{ day: 'Четверг', opening: '09:00', closing: '18:00' },{ day: 'Пятница', opening: '09:00', closing: '18:00' },{ day: 'Суббота', opening: '10:00', closing: '16:00' },],product_description:''},
                                {product_id:'10',product_title:'',product_grade:'4',product_grade_count:'842',product_tag:['',''],product_img:['',''],openingTimes: [{ day: 'Воскресенье', opening: 'закрыто', closing: 'закрыто' },{ day: 'Понедельник', opening: '09:00', closing: '18:00' },{ day: 'Вторник', opening: '09:00', closing: '18:00' },{ day: 'Среда', opening: '09:00', closing: '18:00' },{ day: 'Четверг', opening: '09:00', closing: '18:00' },{ day: 'Пятница', opening: '09:00', closing: '18:00' },{ day: 'Суббота', opening: '10:00', closing: '16:00' },],product_description:''}]
          }
      },
      methods:{
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
    <div class="field">
        <div class="category_main">
            <div class="category_main_filter">
                <div class="category_main_filter_block">
                     <h2>
                        Фильтры
                    </h2>
                    <div class="category_main_filter_money">
                        <div class="category_main_filter_money_block">
                            <div class="category_main_filter_money_block_ruble">
                                <img src="../assets/icon/ruble.svg" alt="">
                            </div>
                            <div class="category_main_filter_money_block_ruble">
                                <img src="../assets/icon/ruble.svg" alt="">
                                <img src="../assets/icon/ruble.svg" alt="">                             
                            </div>
                            <div class="category_main_filter_money_block_ruble">
                                <img src="../assets/icon/ruble.svg" alt="">
                                <img src="../assets/icon/ruble.svg" alt="">
                                <img src="../assets/icon/ruble.svg" alt="">
                            </div>
                            <div class="category_main_filter_money_block_ruble">
                                <img src="../assets/icon/ruble.svg" alt="">
                                <img src="../assets/icon/ruble.svg" alt="">
                                <img src="../assets/icon/ruble.svg" alt="">
                                <img src="../assets/icon/ruble.svg" alt="">
                            </div>
                        </div>
                    </div>
                </div> 
            </div>
            <div class="category_main_product">
                <div class="category_header">
                    <h2>
                        По запросу найдено <div class="product_count">{{ category_product.length }}</div>
                    </h2>
                    <div class="category_tag" v-for="tag in categoryTag">
                        {{ tag }}
                    </div>
                </div>
                <div class="category_main_product_block" v-for="(product,index) in category_product" :key="index">
                    <div class="category_main_product_block-img">
                        <ChildComponent :dataProp="product.product_img" :dataPropId="product.product_id"></ChildComponent>
                    </div>
                    <div class="category_main_product_block-content">
                        <h2 class="category_main_product_block-content-title">
                            {{ index+1 }}. 
                            <router-link :to="{name:'Product',query:{category:product.product_id}}" class="category_main_product_block-content-title-text">
                                {{ product.product_title }}
                            </router-link>
                        </h2>
                        <div  class="activity-block-main-grade">
                            <div  class="activity-block-main-grade_img">
                                <img :src="gradeMethods1(product.product_grade)" alt="">
                            </div>
                            <div  class="activity-block-main-grade_img">
                                <img :src="gradeMethods2(product.product_grade)" alt="">
                            </div>
                            <div  class="activity-block-main-grade_img">
                                <img :src="gradeMethods3(product.product_grade)" alt="">
                            </div>
                            <div  class="activity-block-main-grade_img">
                                <img :src="gradeMethods4(product.product_grade)" alt="">
                            </div>
                            <div  class="activity-block-main-grade_img">
                                <img :src="gradeMethods5(product.product_grade)" alt="">
                            </div>
                            <div class="activity-block-main-grade_count">
                                {{ product.product_grade_count }}
                            </div>
                        </div>
                        <div class="activity-block-main-tag" v-for="tag in product.product_tag">
                            {{ tag }}
                        </div>
                        <div class="activity-block-main-time">
                            <ChildOpeningTimes :OpeningTimes="product.openingTimes"></ChildOpeningTimes>
                        </div>
                        <div class="activity-block-main-description">
                            <div class="activity-block-main-description-img">
                                <img src="../assets/icon/description.svg" alt="">
                            </div>
                            <div class="activity-block-main-description-text">
                                {{ product.product_description }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</template>

<style scoped>
.field{
    max-width: 1200px;
    padding: 20px;
    padding-top: 0;
    margin: 0 auto;
}
.product_count{
    margin-left: 5px;
    display: inline;
    color: gray;
    font-weight: 500;
    font-size: 12px;
}
.category_header{
    margin-bottom: 10px;
}
.category_tag{
    display: inline-block;
    background: rgb(242,245,249);
    border-radius: 15px;
    padding: 7px 15px;
    margin-right: 5px;
    font-size: 13px;
    font-weight: 500;
    margin-bottom: 5px;
    cursor: pointer;
}
.category_tag:hover{
    color: rgb(0,67,174);
    background: rgb(226,231,236);
}

.category_main{
    display: grid;
    grid-template-columns: 200px 1fr;
    min-height: 250px;
    padding: 24px;
    padding-top: 0;
    grid-column-gap: 50px;
}
.category_main_filter{
   position: relative; 
}
.category_main_filter_block{
    position: sticky;
    top: 160px;
}
.category_main_filter_money{
    border-bottom: 1px solid rgb(128, 128, 128,0.3);
}
.category_main_filter_money_block{
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr;
    margin: 20px 10px;
    height: 30px;
    border: 1px solid rgb(128, 128, 128,0.3);
    border-radius: 20px;
    overflow: hidden;
}
.category_main_filter_money_block_ruble{
    display: flex;
    justify-content: center;
    align-items: center;
}
.category_main_filter_money_block_ruble img{
    display: block;
    width: 9px;
}
.category_main_filter_money_block_ruble:hover{
    background: rgb(226,226,230);
}
.category_main_filter_money_block_ruble:nth-child(2){
    border-left: 1px solid rgb(128, 128, 128,0.3);
}
.category_main_filter_money_block_ruble:not(:first-child,:last-child){
    border-right: 1px solid rgb(128, 128, 128,0.3);
}
.category_main_product{
    margin-top: 140px;
}
.category_main_product_block{
    display: grid;
    grid-template-columns: 200px 1fr;
    padding: 20px;
    min-height: 200px;
    border-bottom: 1px solid rgb(128, 128, 128,0.3);
    
}
.category_main_product_block:hover{
    box-shadow: 0px 5px 10px 2px rgba(34, 60, 80, 0.2);
}
.category_main_product_block-img{
    border-radius: 10px;
    overflow: hidden;
}
.category_main_product_block-content{
    margin-left: 20px;
}
.category_main_product_block-content-title{
    margin-top: 0;
    margin-bottom: 10px;
    font-weight: 600;
}
.category_main_product_block-content-title-text{
    display: inline;
    cursor: pointer;
    color: black;
}
.category_main_product_block-content-title-text:hover{
    text-decoration: underline;
}
.activity-block-main-grade{
    display: grid;
    grid-template-columns: 20px 20px 20px 20px 20px 1fr;
    grid-template-rows: 20px;
    gap: 5px;
    margin: 5px 0;
}
.activity-block-main-grade_img img{
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.activity-block-main-grade_count{
    align-self: center;
    margin-left: 5px;
    font-weight: 300;
}
.activity-block-main-tag{
    display: inline-block;
    background: rgb(242,245,249);
    border-radius: 5px;
    padding: 3px 5px;
    margin-right: 5px;
    font-size: 11px;
    font-weight: 700;
    margin-bottom: 5px;
}
.activity-block-main-description img{
    position: absolute;
    top: 5px;
    display: block;
    width: 15px;
}
.activity-block-main-description{
    position: relative;
    display: grid;
    grid-template-columns: 20px 1fr;
    grid-template-rows: 75px;
    overflow: hidden;
}
</style>