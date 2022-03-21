<script>
import { defineComponent } from '@vue/runtime-core'
import { RouterView } from 'vue-router'

export default defineComponent({
  components: {
    RouterView
  }
})

</script>

<template>
  <div>
    <header class="bg-white shadow">
      <div class="mx-auto max-w-7xl px-4 py-6 sm:px-6 lg:px-8">
        <h1
          class="text-3xl font-bold leading-tight text-gray-900"
        >
        </h1>
      </div>
    </header>
    <main>
      <router-view />
    </main>
  </div>
</template>
