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
            const today = new Date().getDay() - 1;
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
            const today = new Date().getDay() - 1;
            const openingHours = this.OpeningTimes[today];

            return openingHours.opening;
        },
        closingTime() {
            const today = new Date().getDay() - 1;
            const openingHours = this.OpeningTimes[today];

            return openingHours.closing;
        },
        nextDayOpeningTime(){
            let nexDay=new Date();
            nexDay.setDate(nexDay.getDate()+1);        
            const nextDayIndex=nexDay.getDay()-1;
            const openingHours=this.OpeningTimes[nextDayIndex>=0?nextDayIndex:6];       
            return openingHours.opening;
        },
        nextDayName() {
            let nextDay = new Date();
            nextDay.setDate(nextDay.getDate() + 1);
            const nextDayIndex = nextDay.getDay() - 1;
            const openingHours = this.openingTimes[nextDayIndex >= 0 ? nextDayIndex : 6];
            return openingHours.day;
        },
    },
}
</script>
<template>
    <div class="activity-block-main-time" v-if="isOpen">
        <div v-if="openingTime == 'открыто'">
            <span class="activity-block-main-time-open">Открыто</span>
        </div>
        <div v-else>
            <span class="activity-block-main-time-open">Открыто</span> до {{ closingTime }}
        </div>
    </div>
    <div class="activity-block-main-time" v-else>
        <div v-if="openingTime =='закрыто' && nextDayOpeningTime=='закрыто'">
            <span class="activity-block-main-time-closed">Закрыто</span>
        </div>
        <div v-else-if="openingTime=='закрыто'">
            <span class="activity-block-main-time-closed">Закрыто</span>, откроется в {{ openingTime }}
        </div>
        <div v-else>
            <span class="activity-block-main-time-closed">Закрыто</span>, откроется в {{ nextDayOpeningTime }}
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