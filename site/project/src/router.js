import { createRouter , createWebHashHistory } from 'vue-router'

import SignI from './components/Signin.vue'
import SignU from './components/SignUp.vue'
import MainM from './components/Main.vue'

export default createRouter({
    history : createWebHashHistory(

    ),
    routes:[
        {path:'/Main',component:MainM,alias:'/'},
        {path:'/SignUp',component:SignU},
        {path:'/SignIn',component:SignI}
    ],
});