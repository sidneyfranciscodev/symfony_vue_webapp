<template>
  <div id="layout">
    <Navbar @sidebar="showSidebar = $event" />
    <Sidebar :show="showSidebar" @update:show="showSidebar = $event" />
    <div id="view">
        <router-view />
    </div>
  </div>
</template>

<script setup>
import Navbar from '@/vue/components/TheNavbar.vue'
import Sidebar from '@/vue/components/TheSidebar.vue'

import { ref } from 'vue'

const showSidebar = ref(false)
</script>
