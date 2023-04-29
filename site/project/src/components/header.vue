<script>

</script>

<template>
    <div class="header">
        <div class="logo">
            <div class="logo-div">
                <img src="../assets/logo_relp.svg" alt="" width="50">
            </div>
        </div>
        <div class="nav">1

        </div>
        <div class="login">1
            
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
</style>