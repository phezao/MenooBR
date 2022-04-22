<template>
  <div class="md:mx-24 mx-8 mt-8">
    <div class="flex flex-col md:flex-row gap-2 md:gap-4 mb-3">
      <div class="md:w-3/4">
        <BaseAutocomplete />
      </div>
      <div class="md:w-1/4">
        <Select />
      </div>
    </div>
    <div class="flex flex-col gap-3" >
      <RecipeCard
        v-for="recipe in options"
        :key="recipe.id"
        :name="recipe.name"
        :id="recipe.id"
        :tags="recipe.tags"
      />
    </div>
  </div>
</template>

<script>
import { defineComponent } from "vue"
import BaseAutocomplete from "@/components/BaseAutocomplete.vue"
import Select from "@/components/Select.vue"
import RecipeCard from "@/components/RecipeCard.vue"

export default defineComponent({
  components: {
  BaseAutocomplete,
  Select,
  RecipeCard
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
});
</script>

<style lang="scss" scoped>

</style>
