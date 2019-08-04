<template class="block">
  <el-timeline>
    <el-timeline-item v-for="item in items" :timestamp="item.timestamp" placement="top">
      <el-card>
        <h5>{{item.title}}</h5>
        <p>{{item.content}}</p>
      </el-card>
    </el-timeline-item>
  </el-timeline>
</template>
<script>
  export default {
    props: {
      items: Array
    }
  }
</script>

<style scoped>
</style>