<script>
import { defineComponent } from '@vue/runtime-core'
import { RouterView } from 'vue-router'
import PageWrapper from './components/PageWrapper.vue';

export default defineComponent({
  components: {
    RouterView,
    PageWrapper
  }
});

</script>

<template>
  <page-wrapper>
    <main>
      <router-view />
    </main>
  </page-wrapper>
</template>

<style lang="postcss">

  html, body, #app{
    height: 100%;
  }

  .btn {
    @apply focus:outline-none w-full rounded-md px-5 py-3 text-base font-medium leading-6 transition duration-150 ease-in-out;
  }

  .btn-indigo {
    @apply bg-indigo-600 shadow text-white border border-transparent hover:bg-indigo-500;
  }

  .btn-ghost{
   @apply text-indigo-600;
  }
</style>
