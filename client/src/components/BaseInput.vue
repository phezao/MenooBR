<template>
  <div class="relative">
  <input :placeholder = "label" class="h-14 w-64 peer
      placeholder-transparent bg-gray-100 border-none
      rounded-lg focus:ring-2 focus:ring-blue-500"
      :type="type"
      :value="modelValue"
      v-bind="$attrs"
      @input="$emit('update:modelValue', $event.target.value)"
    />

    <label class="peer-placeholder-shown:text-base
      peer-placeholder-shown:text-gray-400
      peer-placeholder-shown:top-4
      transition-all
      peer-focus:top-1
      peer-focus:text-gray-500
      peer-focus:text-xs
    text-gray-500 absolute left-3 top-1 text-xs"
    >
      {{ label }}
    </label>
    <span v-if="error" class="text-red-500">{{ error }}</span>
  </div>
</template>

<script>
import { defineComponent } from 'vue';
export default defineComponent({
  props: {
    type: {
      type: String,
      default: 'text'
    },
    label: {
      type: String,
      default: ''
    },
    modelValue: {
      type: [String, Number],
      default: ''
    },
    error: {
      type: String
    }
  }
});

</script>
