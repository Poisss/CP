<script>
import axios from 'axios';
import router from '../router.js';
import { useStore } from '../store/store';
export default{
      
    data() {
        return {
            arrDay:[{title:'1',value:1},{title:'2',value:2},{title:'3',value:3},{title:'4',value:4},{title:'5',value:5},{title:'6',value:6},{title:'7',value:7},{title:'8',value:8},{title:'9',value:9},{title:'10',value:10},
            {title:'11',value:11},{title:'12',value:12},{title:'13',value:13},{title:'14',value:14},{title:'15',value:15},{title:'16',value:16},{title:'17',value:17},{title:'18',value:18},{title:'19',value:19},{title:'20',value:20},
            {title:'2',value:2},{title:'21',value:21},{title:'22',value:22},{title:'23',value:23},{title:'24',value:24},{title:'25',value:25},{title:'26',value:26},{title:'27',value:27},{title:'28',value:28},{title:'29',value:29},{title:'30',value:30},{title:'31',value:31},],
            arrMonth:[{title:'Январь',value:1},{title:'Февраль',value:2},{title:'Март',value:3},{title:'Апрель',value:4},{title:'Май',value:5},{title:'Июнь',value:6},{title:'Июль',value:7},{title:'Август',value:8},{title:'Сентябрь',value:9},{title:'Октябрь',value:10},{title:'Ноябрь',value:11},{title:'Декабрь',value:12}],
            arrYear:[{title:'2023',value:2023},{title:'2022',value:2022},{title:'2021',value:2021},{title:'2020',value:2020},{title:'2019',value:2019},{title:'2018',value:2018},{title:'2017',value:2017},{title:'2016',value:2016},{title:'2015',value:2015},{title:'2014',value:2014},{title:'2013',value:2013},{title:'2012',value:2012},{title:'2011',value:2011},{title:'2010',value:2010},{title:'2009',value:2009},{title:'2008',value:2008},{title:'2007',value:2007},{title:'2006',value:2006},{title:'2005',value:2005},{title:'2004',value:2004},{title:'2003',value:2003},{title:'2002',value:2002},{title:'2001',value:2001},{title:'2000',value:2000},{title:'1999',value:1999},{title:'1998',value:1998},{title:'1997',value:1997},{title:'1996',value:1996},{title:'1995',value:1995},{title:'1994',value:1994},{title:'1993',value:1993},{title:'1992',value:1992},{title:'1991',value:1991},{title:'1990',value:1990},{title:'1989',value:1989},{title:'1988',value:1988},{title:'1987',value:1987},{title:'1986',value:1986},{title:'1985',value:1985},{title:'1984',value:1984},{title:'1983',value:1983},{title:'1982',value:1982},{title:'1981',value:1981},{title:'1980',value:1980},{title:'1979',value:1979},{title:'1978',value:1978},{title:'1977',value:1977},{title:'1976',value:1976},{title:'1975',value:1975},{title:'1974',value:1974},{title:'1973',value:1973},{title:'1972',value:1972},{title:'1971',value:1971},{title:'1970',value:1970},{title:'1969',value:1969},{title:'1968',value:1968},{title:'1967',value:1967},{title:'1966',value:1966},{title:'1965',value:1965},{title:'1964',value:1964},{title:'1963',value:1963},{title:'1962',value:1962},{title:'1961',value:1961},{title:'1960',value:1960},{title:'1959',value:1959},{title:'1958',value:1958},{title:'1957',value:1957},{title:'1956',value:1956},{title:'1955',value:1955},{title:'1954',value:1954},{title:'1953',value:1953},{title:'1952',value:1952},{title:'1951',value:1951},{title:'1950',value:1950},{title:'1949',value:1949},{title:'1948',value:1948},{title:'1947',value:1947},{title:'1946',value:1946},{title:'1945',value:1945},{title:'1944',value:1944},{title:'1943',value:1943},{title:'1942',value:1942},{title:'1941',value:1941},{title:'1940',value:1940},{title:'1939',value:1939},{title:'1938',value:1938},{title:'1937',value:1937},{title:'1936',value:1936},{title:'1935',value:1935},{title:'1934',value:1934},{title:'1933',value:1933},{title:'1932',value:1932},{title:'1931',value:1931},{title:'1930',value:1930},{title:'1929',value:1929},{title:'1928',value:1928},{title:'1927',value:1927},{title:'1926',value:1926},{title:'1925',value:1925},{title:'1924',value:1924},{title:'1923',value:1923},{title:'1922',value:1922},{title:'1921',value:1921},{title:'1920',value:1920},{title:'1919',value:1919},{title:'1918',value:1918},{title:'1917',value:1917},{title:'1916',value:1916},{title:'1915',value:1915},{title:'1914',value:1914},{title:'1913',value:1913},{title:'1912',value:1912},{title:'1911',value:1911},{title:'1910',value:1910},{title:'1909',value:1909},{title:'1908',value:1908},{title:'1907',value:1907},{title:'1906',value:1906},{title:'1905',value:1905},{title:'1904',value:1904},{title:'1903',value:1903},{title:'1902',value:1902},{title:'1901',value:1901}],
            firstName:"",
            lastName:"",
            email:"",
            password:"",
            day:"",
            month:"",
            year:"",
            sex:"",
            passwordType:"password",
            passwordClass:"input_password_span eye",
            inputFocus:[false,false,false,false,false,false,false],
            errorFirstName:false,
            errorLastName:false,
            errorEmail:false,
            errorPassword:false,
            errorDate:false,
            errorSex:false
        }
    },
    mounted() {
        const Store = useStore();

        if (Store.success) {
        router.push({ name: 'home' });
        }
    },
    methods:{
        signUp() {
            if(this.firstName.trim()==''){
                this.errorFirstName=true
            }
            if(this.lastName.trim()==''){
                this.errorLastName=true
            }
            if(this.email.trim()==''){
                this.errorEmail=true
            }
            if(this.password.trim()==''){
                this.errorPassword=true
            }
            if(this.day==''){
                this.errorDate=true
            }
            if(this.month==''){
                this.errorDate=true
            }
            if(this.year==''){
                this.errorDate=true
            }
            if(this.sex==''){
                this.errorSex=true
            }
            if(this.firstName.trim()!='' && this.lastName.trim()!='' && this.email.trim()!='' 
            && this.password.trim()!='' && this.day!='' && this.month!='' 
            && this.year!='' && this.sex!=''){
                const userData = {
                    name: this.firstName,
                    name_last: this.lastName,
                    email: this.email,
                    password: this.password,
                    date: this.year+'-'+this.month+'-'+this.day,
                    sex: this.sex
                };
                axios.post('http://cp/site/project/php/register.php', userData, {
                timeout: 50000,
                headers: {
                    'Content-Type': 'application/json',
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
                })
                .then(response => {
                    console.log(response.data);
                    if (response.data.success) {
                        const Store = useStore()
                        Store.setRole(response.data.role)
                        Store.setName(response.data.name)
                        Store.setSuccess(response.data.success)
                        Store.setNamelast(response.data.name_last)
                        Store.setId(response.data.id)
                        Store.setImg(response.data.img)
                        router.push({name: 'home' })
                    }
                    else{
                        console.log('Ошибка во время авторизации')
                    }
                })
                .catch(error => {
                    console.error(error);
                });
            } 
        },
        switchPassword(){
            this.passwordType=this.passwordType==="password" ? "text" : "password"
            this.passwordClass=this.passwordType==="password" ? "input_password_span eye" : "input_password_span eye-slash"
        }
    }
}
</script>

<template>
    
<div class="field">
    <h1>Регистрация</h1>
    <form @click.prevent>
        <div :class="inputFocus[0]===false ? 'input focus': 'input blur' ">
            <span class="title">Имя<span v-if="this.errorFirstName" class="error">*</span></span>
            <span>
                <input type="text" v-model="firstName" id="name" placeholder="Введите ваше имя" @focus="inputFocus[0] = true" @blur="inputFocus[0] = false">
            </span>
        </div>
        <div :class="inputFocus[1]===false ? 'input focus': 'input blur' ">
            <span class="title">Фамилия<span v-if="this.errorLastName" class="error">*</span></span>
            <span>
                <input type="text" v-model="lastName" id="name" placeholder="Введите вашу фамилию" @focus="inputFocus[1] = true" @blur="inputFocus[1] = false">
            </span>
        </div>
        <span>День рождения<span v-if="this.errorDate" class="error">*</span></span>
        <div class="select">
            <select v-model="day" :class="inputFocus[2]===false ? 'select_focus': 'select_blur' " @click="inputFocus[2] = !inputFocus[2]" @blur="inputFocus[2] = false">
                <option disabled value="">День</option>
                <option v-for="element in arrDay" v-bind:value="element.value" :key="element">{{ element.title }}</option>
            </select>
            <select v-model="month" :class="inputFocus[3]===false ? 'select_focus': 'select_blur' " @click="inputFocus[3] = !inputFocus[3]" @blur="inputFocus[3] = false">
                <option disabled value="">Месяц</option>
                <option v-for="element in arrMonth" v-bind:value="element.value" :key="element">{{ element.title }}</option>
            </select>
            <select v-model="year" :class="inputFocus[4]===false ? 'select_focus': 'select_blur' " @click="inputFocus[4] = !inputFocus[4]" @blur="inputFocus[4] = false">
                <option disabled value="">Год</option>
                <option v-for="element in arrYear" v-bind:value="element.value" :key="element">{{ element.title }}</option>
            </select>
        </div>
        <span>Пол<span v-if="this.errorSex" class="error">*</span></span>
        <div class="radio">   
            <label for="one">
                <input type="radio" id="one" value="1" v-model="sex">
                <span>Мужской</span>
            </label>
            <label for="two">
                <input type="radio" id="two" value="2" v-model="sex">
                <span>Женский</span>
            </label>
        </div>
        <div :class="inputFocus[5]===false ? 'input emailBefore focus': 'input emailBefore blur' ">
            <span class="title">Адрес эл. почты<span v-if="this.errorEmail" class="error">*</span></span>
            <span>
                <input type="email" v-model="email" id="name" placeholder="Введите адрес эл. почты" @focus="inputFocus[5] = true" @blur="inputFocus[5] = false">
            </span>
        </div>
        <div :class="inputFocus[6]===false ? 'input passwordBefore focus': 'input passwordBefore blur' ">
            <span class="title">Пароль<span v-if="this.errorPassword" class="error">*</span></span>
            <span class="input_password">
                <span :class="passwordClass" @click="switchPassword"></span>
                <input :type="passwordType" v-model="password" id="name" placeholder="Введите пароль" @focus="inputFocus[6] = true" @blur="inputFocus[6] = false">
            </span>
        </div>
        <button @click.stop.prevent="signUp">Зарегистрироваться</button>
        <div style="margin-bottom: 35px;">
            Уже есть на Relp? <router-link :to="{name:'SignIn'}">Авторизоваться</router-link>
        </div>
    </form>    
</div>

</template>

<style scoped>
.field{
    display: grid;
    justify-items: center;
    max-width: 600px;
    padding: 20px;
    margin: 100px auto;
    border: 1px solid gray;
    border-radius: 20px;
    box-shadow: 0px 5px 10px 2px rgba(0, 0, 0, 0.2);
}
.title{
    font-size: 17px;
    cursor: default;
}
.error{
    color: red;
}
input{
    width: 340px;
    font-size: 22px;
    display: block;
    background: none;
    padding-left: 48px;
    padding-top: 15px;
    padding-bottom: 15px;
    color: black;
    border: none;
}
input:focus,input:active {
    border: none;
    background: none;
    outline: none;
}
.input{
    display: grid;
    grid-template-columns: 1fr;
    position: relative;
    margin-bottom: 25px;
}

.input::before{
    content: url("../assets/icon/user-regular.svg");
    position: absolute;
    bottom: 29px;
    left: 15px;
    width: 14px;
    height: 14px;
}
.emailBefore::before{
    content: url('../assets/icon/envelope-regular.svg');
}
.passwordBefore::before{
    content: url('../assets/icon/lock-solid.svg');
}
.input::after{
    content: " ";
    height: 3px;
    width: 100%;
    border-radius: 5px;
}
.focus::after{
    background: rgb(128, 128, 128,0.6);
}
.blur::after{
    background: rgb(128, 128, 128,1);
}
.input_password{
    position: relative;
}
.input_password_span{
    background: no-repeat center;
    position: absolute;
    bottom: 16px;
    right: 15px;
    width: 20px;
    height: 20px;
    z-index: 100;
}
.eye{
    background-image: url('../assets/icon/eye-regular.svg');
}
.eye-slash{
    background-image: url('../assets/icon/eye-slash-regular.svg');
}
.radio{
    display: grid;
    grid-template-columns: 1fr 1fr;
    margin-bottom: 20px;
}
.radio label{
    width: 120px;
    display: grid;
    grid-template-columns: 30px auto;
    gap: 10px;
}
input[type="radio"]{
    position: relative;
    width: 20px;
    height: 20px; 
    appearance: none;
    outline: none;
}
input[type='radio']::before {
    content: '';
    position: absolute;
    top: 10px;
    left: 10px;
    width: 15px;
    height: 15px;
    border-radius: 50%;
    transform: translate(-50%, -50%);
    background-color: white;
    border: 1px solid black;
}
input[type='radio']:checked::after {
    content: '';
    position: absolute;
    top: 10px;
    left: 10px;
    width: 10px;
    height: 10px;
    border-radius: 50%;
    background-color: dodgerblue;
    transform: translate(-50%, -50%);
    visibility: visible;
}
.select{
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    gap: 15px;
    margin-top: 15px;
    margin-bottom: 25px;
}
select{
    position: relative;
    padding: 10px;
    border-radius: 7px;
    background: white;
    color: black;
    -moz-appearance: none;
    -webkit-appearance: none;
    appearance: none;
}
select:not([multiple]) {
  padding-right: 1.2em;
  background-repeat: no-repeat;
  background-position: calc(100% - 0.45em) 0.75em;
  background-size: 0.65em auto;
}
.select_focus:not([multiple]) {
    background-image: url("../assets/icon/caret-down-solid.svg");
}
.select_blur:not([multiple]) {
    background-image: url("../assets/icon/caret-up-solid.svg");
}
button{
    width: 390px;
    text-align: center;
    box-shadow: 0px 2px 10px 2px rgba(0, 0, 0, 0.2);
    margin-top: 10px;
    margin-bottom: 15px;
}
</style>