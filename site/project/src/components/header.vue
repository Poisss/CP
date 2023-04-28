<script>

</script>

<template>
    <div class="header">
        <div class="logo">
            <img src="../assets/logo_relp.svg" alt="" width="50">
        </div>
        <div class="field">
            <div class="nav">
                
            </div>
            <div class="log">

            </div>
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
}
.logo{
    display: flex;
    align-items: center;
    position: absolute;
    top: 0px;
    left: 4%;
    height: 100%;
    cursor: pointer;
}
.logo img{
    display: block;
}
.field{
    display: grid;
    grid-template-columns: 4fr 1fr;
    max-width: 1200px;
    padding: 20px;
    margin: 0 auto;
}
</style>