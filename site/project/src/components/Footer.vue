<script>

</script>

<template>
    <div class="header">
        <div class="field">
            <div class="social">
                <a href="https://t.me/Ffifik" class="icon tg"></a>
                <a href="https://vk.com/id181064620" class="icon vk"></a>
                <a href="https://discord.gg/4ZykNB8X" class="icon dis"></a>
            </div>
            <div class="content">
                <div>
                    <h3>О нас</h3>
                    <p>jcyjdfybt rjv</p>
                    <p>jcyjdfybt rjv</p>
                </div>
                <div>
                    <h3>О нас</h3>
                    <p>jcyjdfybt rjv</p>
                    <p>jcyjdfybt rjv</p>
                </div>
                <div>
                    <h3>О нас</h3>
                    <p>jcyjdfybt rjv</p>
                    <p>jcyjdfybt rjv</p>
                </div>
            </div>
            <hr>
            <div class="copy">
                Авторские права &copy; 2023 Relp Inc. Relp, , и связанные знаки являются зарегистрированными товарными знаками Relp.
            </div>
        </div>
    </div>
</template>

<style scoped>
hr{
    width: 100%;
    height: 2px;
    background: rgb(0, 128, 107);
    border: none;
    border-radius: 3px;
}
.header{
    width: 100vw;
    background: rgb(127, 255, 212);
    padding: 60px 0 ;
}
.field{
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 40px;
    color: #333333;
}
.social{
 display: grid;
 grid-template-columns: 60px 60px 60px auto 100px;
 grid-template-areas: "tg vk dis . top";
}
.icon{  
    width: 50px;
    height: 50px;
    display: block;
}
.tg{
    grid-area: tg;
    background: url('../assets/icon/telega.svg') no-repeat center;
}
.tg:hover{
    background: url('../assets/icon/telega2.svg') no-repeat center;
}
.vk{
    grid-area: vk;
    background: url('../assets/icon/vk.svg') no-repeat center;
}
.vk:hover{
    background: url('../assets/icon/vk2.svg') no-repeat center;
}
.dis{
    grid-area: dis;
    background: url('../assets/icon/dis.svg') no-repeat center;
}
.dis:hover{
    background: url('../assets/icon/dis2.svg') no-repeat center;
}
.top{
    grid-area: top;
    text-align: right;
}
.content{
    display: grid;
    grid-template-columns: 200px 200px 200px auto;

}
.copy{
    font-size: 0.75em;
}
</style>