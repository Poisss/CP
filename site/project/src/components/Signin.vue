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
    <h3>Sign in</h3>
    <form>
        <input type="text" v-model="f">
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
</style>