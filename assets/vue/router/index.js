import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(`/app`),
  routes: [
    {
      path: '/',
      component: () => import('../layout/ClientLayout.vue'),
      children: [
        { path: '', name: 'home', component: () => import('../view/VueHome.vue') },
      ]
    },
  ],
})

export default router
