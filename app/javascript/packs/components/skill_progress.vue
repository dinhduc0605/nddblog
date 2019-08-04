<template>
  <div>
    <div class="skill-label">{{ skill_name }}</div>
    <el-progress :percentage="percentage" :color="color"></el-progress>
  </div>
</template>

<script>
  export default {
    props: {
      skill_name: String,
      percentage: Number,
      color: String
    }
  }
</script>

<style scoped>
  .skill-label {
    margin-top: 15px;
  }
</style>
