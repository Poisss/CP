<script>
export default{
    data() {
        return {
            email:"",
            password:"",
            passwordType:"password",
            passwordClass:"input_password_span eye",
            inputFocus:[false,false],
            rr: null
        }
    },
    mounted() {
        this.rr = this.$route.query.id
    },
    methods:{
        switchPassword(){
            this.passwordType=this.passwordType==="password" ? "text" : "password"
            this.passwordClass=this.passwordType==="password" ? "input_password_span eye" : "input_password_span eye-slash"
        }
    }
}
</script>

<template>

<div class="field">
    <h1>Вход{{rr}}</h1>
    <form>
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
        <button>Войти</button>
        <div></div>
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
    margin-bottom: 35px;
}
</style>