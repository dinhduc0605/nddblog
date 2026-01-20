import Vue from 'vue/dist/vue.js'
import SkillProgress from '../components/skill_progress.vue'
import CustomerTimeline from '../components/timeline.vue'

import {Progress, Timeline, TimelineItem, Card} from 'element-ui';
Vue.use(Progress);
Vue.use(Timeline);
Vue.use(TimelineItem);
Vue.use(Card);

new Vue({
  el: '#about-page',
  components: {
    'skill-progress' : SkillProgress,
    'customer-timeline': CustomerTimeline
  }
});
