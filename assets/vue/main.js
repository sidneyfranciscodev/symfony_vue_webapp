import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from '@/vue/App.vue'
import router from '@/vue/router'

import '@/vue/assets/styles/main.scss';

const app = createApp(App)
const pinia = createPinia()

app.use(pinia)
app.use(router)

app.mount('#app')
