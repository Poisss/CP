<script>
export default{
    data() {
        return {
            category_more_click: false,
            category_card:[{title:'Рестораны',img:'/src/assets/restaurants.png'},{title:'Покупки',img:'/src/assets/gift.svg'},
                            {title:'Ночные развлечения',img:'/src/assets/moon1.svg'},{title:'Активная жизнь',img:'/src/assets/active.svg'},
                            {title:'Красота',img:'/src/assets/salon.svg'},{title:'Автомобили',img:'/src/assets/auto_services.png'},
                            {title:'Домашние услуги',img:'/src/assets/house.svg'},],
            category_card_more:[{title:'Животные',img:'/src/assets/pet.svg'},{title:'Природа',img:'/src/assets/forest.svg'},
                                {title:'Отели',img:'/src/assets/bed.svg'},{title:'Еда',img:'/src/assets/eat.svg'},
                                {title:'Услуги',img:''},{title:'Мероприятии',img:''},
                                {title:'Государственные услуги',img:'/src/assets/public.svg'},{title:'Медицина',img:'/src/assets/hospital.svg'},]                            
        }
    },
    methods:{
        
    }
}
</script>

<template>
    <div class="block-main">
        <div class="main">
            <div class="field">
                <h2 class="title-block">
                    Недавняя активность
                </h2>
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
                            <img src="../assets/dot.svg" alt="">
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
.block-main{
    width: 100vw;
}
.field{
    max-width: 1200px;
    padding: 20px;
    margin: 0 auto;
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
    row-gap: 50px;
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