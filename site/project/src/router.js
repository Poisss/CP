import { createRouter , createWebHashHistory } from 'vue-router'

import SignI from './components/Signin.vue'
import SignU from './components/SignUp.vue'
import MainM from './components/Main.vue'
import catalog from './components/catalog.vue'

export default createRouter({
    history : createWebHashHistory(

    ),
    routes:[
        {
            path:'/',
            name:'home',
            component:MainM,
            alias:'/',
            props: true
        },
        {
            path:'/SignUp',
            name:'SignUp',
            component:SignU,
            props: true
        },
        {
            path:'/SignIn',
            name:'SignIn',
            component:SignI,
            props: true
        },
        {
            path:'/Catalog',
            name:'Catalog',
            component:catalog,
            props: true
        }
    ],
});