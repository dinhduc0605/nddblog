import Rails from 'rails-ujs';
Rails.start();

import Vue from 'vue/dist/vue.js'
import SkillProgress from '../components/skill_progress'
import CustomerTimeline from '../components/timeline'

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
