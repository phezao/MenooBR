<template>
    <n-select
      v-model:value="value"
      :options="options"
      clearable="true"
      multiple="true"
      placeholder="Tags"
    />
</template>

<script>
import { defineComponent, ref } from "vue";
import { NSelect } from "naive-ui";

export default defineComponent({
  components: {
    NSelect
  },
  setup() {
    return {
      value: ref(null),
      options: [
        {
          label: "Meat",
          value: "tag0",
        },
        {
          label: "Vegetarian",
          value: "tag1"
        },
        {
          label: "Pasta",
          value: "tag2"
        },
        {
          label: "Low carb",
          value: "tag3",
        },
        {
          label: "Fish",
          value: "tag4"
        },
      ]
    };
  }
});
</script>
