<template>
  <div class="bg-white w-full shadow" >
    <div class="mx-auto max-w-7xl px-4 py-6 sm:px-6 lg:px-8" >
      <div class="flex justify-between items-center" >
        <h1 class="text-2xl font-bold leading-tight text-gray-900" >
          MenooBR
        </h1>
        <div class="w-1/2 md:flex hidden" >
          <button class="btn btn-ghost">Recipes</button>
          <button class="btn btn-ghost">Menu</button>
          <button class="btn btn-indigo">
            <router-link to="/about">Add Recipe</router-link>
          </button>

        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import { defineComponent } from "vue"
  import BaseButtonVue from "./BaseButton.vue";
  import { RouterLink } from "vue-router";

export default defineComponent({
    components: {
      BaseButtonVue,
      RouterLink
    }
  });
</script>
