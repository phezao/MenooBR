<template>
  <div class="shadow px-4 py-6 rounded-md w-96">
    <div class="header-title flex justify-between mb-2">
      <h4 class="font-semibold">{{ name }}</h4>
      <button class="text-base leading-6 font-semibold btn-ghost">View</button>
    </div>
    <div class="body">
      <div class="tags flex gap-1">
        <span class="px-4 py-1 text-sm leading-3 tracking-tight bg-green-400 rounded-full text-white">Vegan</span>
        <span class="px-4 py-1 text-sm leading-3 tracking-tight bg-red-500 rounded-full text-white">Meat</span>
      </div>
    </div>
  </div>
</template>

<script>
  import { defineComponent } from "vue"

  export default defineComponent({
    props: {
      name: {
        type: String,
        default: 'Recipe',
        required: true
      },
      id: {
        type: Number,
        required: true
      },
      tags: {
        type: Array,
        required: false
      }
    }
  });
</script>
