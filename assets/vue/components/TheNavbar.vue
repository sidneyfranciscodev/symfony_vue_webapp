<script setup>
import { ref } from "vue";

const emit = defineEmits(["sidebar"]);

const dropdown = ref(false);

const toggleDropdown = () => (dropdown.value = !dropdown.value);
const toggleMenu = () => emit("sidebar", true);

</script>

<template>
    <nav id="navbar">
        <button
            class="toggler"
            @click="toggleMenu"
            aria-label="Abrir menu"
            aria-controls="sidebar"
        >
            <span></span>
            <span></span>
            <span></span>
        </button>

        <div class="navigation">
            <div class="dropdown">
                <button @click="toggleDropdown" class="dropdown-btn">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="21" height="21"><!--!Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc.--><path fill="black" d="M495.9 166.6c3.2 8.7 .5 18.4-6.4 24.6l-43.3 39.4c1.1 8.3 1.7 16.8 1.7 25.4s-.6 17.1-1.7 25.4l43.3 39.4c6.9 6.2 9.6 15.9 6.4 24.6c-4.4 11.9-9.7 23.3-15.8 34.3l-4.7 8.1c-6.6 11-14 21.4-22.1 31.2c-5.9 7.2-15.7 9.6-24.5 6.8l-55.1-17.5c-13.6 10.3-28.2 18.2-44 24.2l-11.6 58.3c-4.5 22.6-24.8 38.6-47.4 38.6h-16.5c-22.6 0-42.8-16-47.4-38.6l-11.6-58.3c-15.8-6-30.4-13.9-44-24.2l-55.1 17.5c-8.8 2.8-18.6 .3-24.5-6.8c-8.1-9.8-15.5-20.2-22.1-31.2l-4.7-8.1c-6.1-11-11.4-22.4-15.8-34.3c-3.2-8.7-.5-18.4 6.4-24.6l43.3-39.4C64.6 273.1 64 264.6 64 256s.6-17.1 1.7-25.4L22.4 191.2c-6.9-6.2-9.6-15.9-6.4-24.6c4.4-11.9 9.7-23.3 15.8-34.3l4.7-8.1c6.6-11 14-21.4 22.1-31.2c5.9-7.2 15.7-9.6 24.5-6.8l55.1 17.5c13.6-10.3 28.2-18.2 44-24.2l11.6-58.3C227.2 16 247.4 0 270 0h16.5c22.6 0 42.8 16 47.4 38.6l11.6 58.3c15.8 6 30.4 13.9 44 24.2l55.1-17.5c8.8-2.8 18.6-.3 24.5 6.8c8.1 9.8 15.5 20.2 22.1 31.2l4.7 8.1c6.1 11 11.4 22.4 15.8 34.3zM256 336a80 80 0 1 0 0-160 80 80 0 1 0 0 160z"/></svg>
                </button>
                <ul class="list" v-show="dropdown">
                    <li><router-link to="/">link1</router-link></li>
                    <li><router-link to="/">link2</router-link></li>
                    <li><router-link to="/">link3</router-link></li>
                </ul>
            </div>
        </div>
    </nav>
</template>