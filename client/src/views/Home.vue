<script>
import ButtonRepo from '@/components/ButtonRepo.vue'
import BaseButton from '@/components/BaseButton.vue';
import RecipeCardVue from '@/components/RecipeCard.vue';

export default {
  components: {
    ButtonRepo,
    BaseButton,
    RecipeCardVue
  },
  setup(){

    const options = [
      {
        id: 1,
        name: 'Arroz e feijão, purê de batata, carne grelhada',
        tags: ['meat', 'homemade']
      },
      {
        id: 2,
        name: 'Salada com frango grelhado',
        tags: ['chicked', 'homemade', 'salad']
      },
      {
        id: 3,
        name: 'Macarrão a bolonhesa',
        tags: ['carbs', 'meat', 'homemade']
      }
    ];

    return {
      options
    }


  }
}

</script>

<template>
  <div>
    <div
      class="mx-auto max-w-screen-xl px-4 py-12 sm:px-6 lg:flex lg:items-center lg:justify-between lg:py-16 lg:px-8"
    >
      <h2
        class="text-3xl font-extrabold leading-9 tracking-tight text-gray-900 sm:text-4xl sm:leading-10"
      >
        Ready to dive in?
        <br />
        <span class="text-indigo-600">Vite + Vue 3 + Tailwind CSS</span>
      </h2>
      <div class="mt-8 flex lg:mt-0 lg:flex-shrink-0">
        <div class="inline-flex rounded-md shadow">
          <router-link
            to="/about"
            class="inline-flex items-center justify-center rounded-md border border-transparent bg-indigo-600 px-5 py-3 text-base font-medium leading-6 text-white transition duration-150 ease-in-out hover:bg-indigo-500 focus:outline-none"
            >Next Page</router-link
          >
        </div>
        <ButtonRepo />
      </div>
    </div>
    <div class="flex flex-col gap-3">
      <recipe-card-vue
        v-for="recipe in options" :key="recipe.id"
       :name="recipe.name" :id="recipe.id" :tags="recipe.tags" />
    </div>
  </div>
</template>
