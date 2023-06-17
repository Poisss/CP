<script>
export default {
  name: 'ChildComponent',
  props: {
    dataProp: {
      type: Array,
      required: true
    },
    dataPropId: {
      type: String,
      required: true
    }
  },
  data(){
    return{
        indexImg:0,
        arrowLeft:true,
        arrowRight:false,
        arrowIf:true
    }
  },
  mounted(){
    if(this.dataProp.length<2){
        this.arrowIf=false;
    }
  },
  methods:{
    nextImg(){
        if(this.indexImg<this.dataProp.length-1){
            this.indexImg++
            if(this.indexImg<this.dataProp.length-1 && this.indexImg>0){
                this.arrowLeft=false;
                this.arrowRight=false;
            }
            if(this.indexImg==this.dataProp.length-1){
                this.arrowLeft=false;
                this.arrowRight=true;
            }
        }
        
    },
    prevImg(){
        if(this.indexImg>0){
            this.indexImg=this.indexImg-1
            if(this.indexImg<this.dataProp.length-1 && this.indexImg>0){
                this.arrowLeft=false;
                this.arrowRight=false;
            }
            if(this.indexImg==0){
                this.arrowLeft=true;
                this.arrowRight=false;
            }
        }
        
    }
  }
}
</script>

<template>
    <div class="category_banner" :style="{ backgroundImage: `url(${this.dataProp[indexImg]})` }">
        <div v-if="arrowIf" :class="[arrowLeft?'arrowOpacity':'','category_arrow','arrow_left']" @click="prevImg()">
                                    
        </div>
        <div v-if="arrowIf" :class="[arrowRight?'arrowOpacity':'','category_arrow','arrow_right']" @click="nextImg()">

        </div>
        <router-link :to="{name:'Product',query:{category:this.dataPropId}}" class="category_banner-link">

        </router-link>
    </div>
</template>

<style scoped>
    .category_banner{
    display: block;
    cursor: pointer;
    position: relative;
    height: 100%;
    width: 100%;
    background-position: 50%;
    background-size: cover;
    background-repeat: no-repeat;
}
.category_banner-link{
    position: absolute;
    height: 100%;
    width: 100%; 
}
.arrow_left{
    position: absolute;
    left: 10px;
    top: 45%;
    background: url("../assets/icon/arrow-circle-left.svg");
}
.arrow_right{
    position: absolute;
    right: 10px;
    top: 45%;
    background: url("../assets/icon/arrow-circle-right.svg");
}
.category_arrow{
    height: 25px;
    width: 25px;
    border-radius: 10px;
    background-position: 50%;
    background-size: cover;
    background-repeat: no-repeat;
    z-index: 10;
}
.arrowOpacity{
    opacity: 0.4;
}
</style>