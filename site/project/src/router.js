import { createRouter , createWebHashHistory } from 'vue-router'

import SignI from './components/Signin.vue'
import SignU from './components/SignUp.vue'
import MainM from './components/Main.vue'
import catalog from './components/catalog.vue'
import product from './components/product.vue'
import profileUp from './components/profileUp.vue'
import profileView from './components/profileView.vue'
import control from './components/control.vue'
import info from './components/information.vue';

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
            path:'/info',
            name:'info',
            component:info,
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
        },
        {
            path:'/user_etit',
            name:'profileUp',
            component:profileUp,
            props: true
        },
        {
            path:'/user_details',
            name:'profileView',
            component:profileView,
            props: true
        },
        {
            path:'/control',
            name:'control',
            component:control,
            props: true
        },
        {
            path:'/Product',
            name:'Product',
            component:product,
            props: true
        }

    ],
});