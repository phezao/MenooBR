<template>
  <button class="bg-indigo-600 text-white w-24
    rounded-md shadow px-5 py-3 text-base font-medium leading-6
    border border-transparent
    transition duration-150 ease-in-out hover:bg-indigo-500 focus:outline-none"
  >
    {{label}}
    <slot />
  </button>
</template>

<script>
export default {
  props: {
    label: {
      type: String,
      required: true
    }
  }
}
</script>
