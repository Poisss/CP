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
            const openingTime = new Date();
            const closingTime = new Date();
            const [openingHoursStart, openingHoursEnd] = openingHours.opening.split(':');
            const [closingHoursStart, closingHoursEnd] = openingHours.closing.split(':');

            openingTime.setHours(openingHoursStart);
            openingTime.setMinutes(openingHoursEnd);
            closingTime.setHours(closingHoursStart);
            closingTime.setMinutes(closingHoursEnd);

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
    },
}
</script>
<template>
    <div class="activity-block-main-time" v-if="isOpen">
        <span class="activity-block-main-time-open">Открыто</span> до {{ closingTime }}
    </div>
    <div class="activity-block-main-time" v-else>
        <span class="activity-block-main-time-closed">Закрыто</span>, откроется в {{ openingTime }}
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