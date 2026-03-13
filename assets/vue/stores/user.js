import { defineStore } from 'pinia'
import { computed, ref } from 'vue'

export const useUserStore = defineStore('user', () => {
    const uid = ref(null)
    const email = ref(null)

    const getUid = computed(() => uid.value)
    const setUser = u => uid.value = u

    const getEmail = computed(() => email.value)
    const setEmail = e => email.value = e

    return { getUid, getEmail, setUser, setEmail }
})

