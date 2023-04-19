<script>
export default{
    data() {
        return {
            
        }
    }
}
</script>

<template>

<div class="field">
    <h3>Sign up</h3>
    <form>
        <div class="input">
            <span>Имя</span>
            <span>
                <input type="text" v-model="name" id="name">
            </span>
        </div>
        <!-- <input type="text" v-model="email" id="email"><br>
        <input type="text" v-model="password" id="password">
        <input type="text" v-model="repassword" id="confirm">
        <button @click="g">Отправить</button> -->
    </form>    
</div>

</template>

<style scoped>
.field{
    display: grid;
    justify-items: center;
    max-width: 1200px;
    padding: 20px;
    margin: 0 auto;
}
input{
    display: block;
    background: none;
    padding-left: 10px;
    color: black;
    border: none;
}
input:focus,input:active {
    border: none;
    background: none;
    outline: none;
}
input:checked{
    background: blue;
}
.input{
    display: grid;
    grid-template-columns: 1fr;
}
.input::before{
    content: "d";
}
.input::after{
    content: ' ';
    height: 3px;
    width: 100%;
    background: rgb(128, 128, 128,0.6);
    border-radius: 5px;
}
</style>