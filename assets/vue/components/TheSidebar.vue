<template>
    <transition name="slide">
        <aside id="sidebar" v-show="show">
            <div>
                <h1 class="info">Sidebar</h1>
                <button
                    class="toggler"
                    @click="toggle"
                >
                    <span class="open"></span>
                    <span class="open"></span>
                    <span class="open"></span>
                </button>
            </div>
            <ul>
                <li v-for="link in links" :key="link.name">
                    <RouterLink :to="link.link">{{ link.name }}</RouterLink>
                </li>
            </ul>
        </aside>
    </transition>
</template>

<script setup>
import { computed } from 'vue'

const props = defineProps({ show: Boolean })
const emit = defineEmits(['update:show'])

const toggle = () => emit('update:show', !props.show)

const links = computed(() => [
  { name: 'link1', link: '/' },
  { name: 'link2', link: '/' },
  { name: 'link3', link: '/' },
])
</script>
