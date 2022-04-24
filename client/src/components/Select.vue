<template>
    <n-select
      v-model:value="value"
      :options="options"
      :clearable="true"
      :multiple="true"
      placeholder="Tags"
      :on-update:value="$emit('searchEvent', value)"
    />
</template>

<script>
import { defineComponent, ref } from "vue";
import { NSelect } from "naive-ui";

export default defineComponent({
  components: {
    NSelect
  },
  props: {
    options: {
      type: Array
    }
  },
  setup() {
    return {
      value: ref(null),
    };
  }
});
</script>
