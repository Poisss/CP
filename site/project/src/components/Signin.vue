<script>
import axios from 'axios';
import router from '../router.js';
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
            email:"",
            password:"",
            passwordType:"password",
            passwordClass:"input_password_span eye",
            inputFocus:[false,false],
            rr: null,
            errorMessage:''
        }
    },
    mounted() {
        this.rr = this.$route.query.id
        const Store = useStore();

        if (Store.success) {
        router.push({ name: 'home' });
        }
    },
    methods:{
        signIn() {
            const userData = {
                email: this.email,
                password: this.password
            };
            axios.post('http://cp/site/project/php/authoriz.php', userData, {
                timeout: 50000,
                headers: {
                    'Content-Type': 'application/json',
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            })
            .then(response => {
                console.log(response.data);
                if(response.data.success){
                    const Store = useStore()
                    Store.setRole(response.data.role)
                    Store.setName(response.data.name)
                    Store.setSuccess(response.data.success)
                    Store.setNamelast(response.data.name_last)
                    Store.setId(response.data.id)
                    Store.setImg(response.data.img)
                    router.push({name: 'home'})
                }else{
                    this.errorMessage = response.data.message
                }
            })
            .catch(error => {
                if (error.response) {
                    console.error('Ошибка ответа от сервера:', error.response.data);
                } else if (error.request) {
                    console.error('Ошибка запроса:', error.request);
                } else {
                    console.error('Ошибка настройки запроса:', error.message);
                }
            });
        },
        switchPassword(){
            this.passwordType=this.passwordType==="password" ? "text" : "password"
            this.passwordClass=this.passwordType==="password" ? "input_password_span eye" : "input_password_span eye-slash"
        }
    }
}
</script>

<template>

<div class="field">
    <h1>Авторизация</h1>
    <div v-if="errorMessage" class="errorMessage">{{ errorMessage }}</div>
    <form @click.prevent>
        <div :class="inputFocus[0]===false ? 'input emailBefore focus': 'input emailBefore blur' ">
            <span class="title">Адрес эл. почты</span>
            <span>
                <input type="email" v-model="email" id="name" placeholder="Введите адрес эл. почты" @focus="inputFocus[0] = true" @blur="inputFocus[0] = false">
            </span>
        </div>
        <div :class="inputFocus[1]===false ? 'input passwordBefore focus': 'input passwordBefore blur' ">
            <span class="title">Пароль</span>
            <span class="input_password">
                <span :class="passwordClass" @click="switchPassword"></span>
                <input :type="passwordType" v-model="password" id="name" placeholder="Введите пароль" @focus="inputFocus[1] = true" @blur="inputFocus[1] = false">
            </span>
        </div>
        <button @click.stop.prevent="signIn">Войти</button>
        <div style="margin-bottom: 35px;">
            Новичок в Relp? <router-link :to="{name:'SignUp'}">Зарегистрироваться</router-link>
        </div>
    </form>    
</div>

</template>

<style scoped>
.field{
    display: grid;
    justify-items: center;
    max-width: 600px;
    padding: 20px;
    margin: 100px auto;
    border: 1px solid gray;
    border-radius: 20px;
    box-shadow: 0px 5px 10px 2px rgba(0, 0, 0, 0.2);
}
.errorMessage{
    color: red;
}
.title{
    font-size: 17px;
    cursor: default;
}
input{
    width: 340px;
    font-size: 22px;
    display: block;
    background: none;
    padding-left: 48px;
    padding-top: 15px;
    padding-bottom: 15px;
    color: black;
    border: none;
}
input:focus,input:active {
    border: none;
    background: none;
    outline: none;
}
.input{
    display: grid;
    grid-template-columns: 1fr;
    position: relative;
    margin-bottom: 25px;
}

.input::before{
    content: url("../assets/icon/user-regular.svg");
    position: absolute;
    bottom: 29px;
    left: 15px;
    width: 14px;
    height: 14px;
}
.passwordBefore::before{
    content: url('../assets/icon/lock-solid.svg');
}
.input::after{
    content: " ";
    height: 3px;
    width: 100%;
    border-radius: 5px;
}
.focus::after{
    background: rgb(128, 128, 128,0.6);
}
.blur::after{
    background: rgb(128, 128, 128,1);
}
.input_password{
    position: relative;
}
.input_password_span{
    background: no-repeat center;
    position: absolute;
    bottom: 16px;
    right: 15px;
    width: 20px;
    height: 20px;
    z-index: 100;
}
.eye{
    background-image: url('../assets/icon/eye-regular.svg');
}
.eye-slash{
    background-image: url('../assets/icon/eye-slash-regular.svg');
}
button{
    width: 390px;
    text-align: center;
    box-shadow: 0px 2px 10px 2px rgba(0, 0, 0, 0.2);
    margin-top: 15px;
    margin-bottom: 15px;
}
</style>