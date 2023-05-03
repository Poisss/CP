<script>

</script>

<template>
    <div class="header">
        <div class="logo">
            <router-link :to="{name:'home'}" class="logo-div">
                <img src="../assets/logo_relp.svg" alt="" width="50">
            </router-link>
        </div>
        <div class="nav">1

        </div>
        <div class="login">
            <router-link :to="{
                name:'SignUp',
                params:id=1
                }">
                Регистрация
            </router-link>
            <router-link :to="{
                name:'SignIn',
                query:{id:'1'}
                }">
                Войти
            </router-link>
        </div>
    </div>
</template>

<style scoped>
.header{
    width: 100vw;
    background: rgb(127, 255, 212);
    position: relative;
    min-height: 100px;
    border-bottom: 1px solid gray;
    display: grid;
    grid-template-columns: minmax(200px,1fr) minmax(300px,1200px) minmax(300px,1fr);
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
    left: 75px;
    height: 100%;
    cursor: pointer;
}
.logo img{
    display: block;
}
.login{
    display: grid;
    grid-template-columns: 1fr 1fr;
    justify-items: center;
    align-items: center;
}
</style>