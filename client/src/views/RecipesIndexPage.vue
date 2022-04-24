<template>
  <div class="md:mx-24 mx-8 mt-8">
    <div class="flex flex-col md:flex-row gap-2 md:gap-4 mb-3">
      <div class="md:w-3/4">
        <n-auto-complete
          v-model:value="searchQuery"
          :options="filteredOptions"
          placeholder="Search"
        />
      </div>
      <div class="md:w-1/4">
        <n-select
          v-model:value="tagsQuery"
          :options ="uniqueArray"
          :clearable="true"
          :multiple="true"
          placeholder="Tags"
         @update:value="printValue"
        />
      </div>
    </div>
    <div class="flex flex-col gap-3" >
      <RecipeCard
        v-for="recipe in filteredOptions"
        :key="recipe.id"
        :name="recipe.label"
        :id="recipe.id"
        :tags="recipe.tags"
      />
    </div>
  </div>
</template>

<script>
import { defineComponent, ref, computed } from "vue"
import { NAutoComplete, NSelect } from 'naive-ui';
import BaseAutocomplete from "@/components/BaseAutocomplete.vue"
import Select from "@/components/Select.vue"
import RecipeCard from "@/components/RecipeCard.vue"

export default defineComponent({
  components: {
  BaseAutocomplete,
  NAutoComplete,
  NSelect,
  Select,
  RecipeCard
  },
  setup(){
    const searchQuery = ref("");
    const tagsQuery = ref([]);
    const options = [
      {
        id: 1,
        label: 'Arroz e feijão, purê de batata, carne grelhada',
        tags: ['meat', 'homemade']
      },
      {
        id: 2,
        label: 'Salada com frango grelhado',
        tags: ['chicken', 'homemade', 'salad']
      },
      {
        id: 3,
        label: 'Macarrão a bolonhesa',
        tags: ['carbs', 'meat', 'homemade']
      }
    ];

    const filteredOptions = computed(() => {
      return options.filter(option => option.label.toLowerCase().includes(searchQuery.value.toLowerCase()))
    });

    const printValue = (value) => {
      tagsQuery.value = value;
    };

    const arrayTags = options.map((option) => option.tags).flat(1)
    const uniqueSet = new Set(arrayTags)
    const uniqueArray = Array.from(uniqueSet, v => (
      {
        ["label"]: v,
        ["value"]: v
      }
    ))
    return {
      filteredOptions,
      uniqueArray,
      searchQuery,
      tagsQuery,
      printValue
    }
  }
});
</script>
