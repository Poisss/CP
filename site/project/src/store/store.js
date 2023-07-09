import { defineStore } from 'pinia'

export const useStore = defineStore('Store',{
    state: ()=> ({
        id: Number,
        role:'',
        name:'',
        name_last:'',
        img:'',
        success:false
    }),
    actions:{
        setRole(role){
            this.role = role
        },
        setName(name){
            this.name = name
        },
        setSuccess(success){
            this.success = success
        },
        setNamelast(name_last){
            this.name_last = name_last
        },
        setId(id){
            this.id = id
        },
        setImg(img){
            this.img = img
        }
    }

    
})