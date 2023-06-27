<script>
export default {
    name: 'ChildComponent',
    props: {
        OpeningTimes: {
            type: Array,
            required: true
        }
    },
    computed: {
        isOpen() {
            const today = new Date().getDay();
            const openingHours = this.OpeningTimes[today];
            if (openingHours.opening === 'закрыто') {
                return false;
            }
            if (openingHours.opening === 'открыто') {
                return true;
            }
            const openingTime = new Date();
            const closingTime = new Date();
            const [openingHoursStart, openingHoursEnd] = openingHours.opening.split(':');
            const [closingHoursStart, closingHoursEnd] = openingHours.closing.split(':');

            openingTime.setHours(openingHoursStart);
            openingTime.setMinutes(openingHoursEnd);
            closingTime.setHours(closingHoursStart);
            closingTime.setMinutes(closingHoursEnd);

            if (closingTime < openingTime) {
                closingTime.setDate(closingTime.getDate() + 1);
            }

            return openingTime < new Date() && closingTime > new Date();
        },
        openingTime() {
            const today = new Date().getDay();
            const openingHours = this.OpeningTimes[today];

            return openingHours.opening;
        },
        closingTime() {
            const today = new Date().getDay();
            const openingHours = this.OpeningTimes[today];
            
            return openingHours.closing;
        },
        Time(){
            const today = new Date().getDay();
            const time=new Date();
            const hours=time.getHours();
            const minutes=time.getMinutes();
            const time1= `${hours < 10 ? '0' + hours : hours}:${minutes < 10 ? '0' + minutes : minutes}`;
            const time2=`${this.OpeningTimes[today].opening}`;
            const date1 = new Date(`2000-01-01T${time1}:00Z`);
            const date2 = new Date(`2000-01-01T${time2}:00Z`);
            if (date1.getTime() > date2.getTime()) {
                return false;
            } 
            else {
                return true;
            }
        },
        nextDayOpeningTime(){
            let nexDay=new Date();
            nexDay.setDate(nexDay.getDate()+1);        
            const nextDayIndex=nexDay.getDay();
            const openingHours=this.OpeningTimes[nextDayIndex>=0?nextDayIndex:6];
                   
            return openingHours.opening;
        },
        
    },
}
</script>
<template>
    <div class="activity-block-main-time" v-if="isOpen">
        <div v-if="openingTime === 'открыто'">
            <span class="activity-block-main-time-open">Открыто</span>
        </div>
        <div v-else>
            <span class="activity-block-main-time-open">Открыто</span> до {{ closingTime }}
        </div>
    </div>
    <div class="activity-block-main-time" v-else>
        
        <div v-if="openingTime === 'закрыто' && nextDayOpeningTime === 'закрыто'">
            <span class="activity-block-main-time-closed">Закрыто</span>
        </div>
        <div v-else-if="openingTime === 'закрыто'">
            <span class="activity-block-main-time-closed">Закрыто</span>, откроется в завтро 
            <span v-if="nextDayOpeningTime !== 'открыто'">в {{nextDayOpeningTime }}</span>
        </div>
        <div v-else-if="Time">
            <span class="activity-block-main-time-closed">Закрыто</span>, откроется сегодня в {{
                openingTime }}
        </div>
        <div v-else>
            <span class="activity-block-main-time-closed">Закрыто</span>, откроется завтро 
            <span v-if="nextDayOpeningTime !== 'открыто'">в {{nextDayOpeningTime }}</span>
        </div>
    </div>
</template>
<style scoped>
.activity-block-main-time{
    font-size: 14px;
}
.activity-block-main-time-open{
    color: rgb(0,128,85);
    font-weight: 700;
}
.activity-block-main-time-closed{
    color:rgb(224,7,7);
    font-weight: 700;
}
</style>