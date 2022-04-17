<template>
  <div class="bg-white w-full shadow" >
    <div class="mx-auto max-w-7xl px-4 py-6 sm:px-6 lg:px-8" >
      <div class="flex justify-between items-center" >
        <h1 class="text-2xl font-bold leading-tight text-gray-900" >
          <router-link to="/">
              MenooBR
          </router-link>
        </h1>
        <div class="w-1/2 md:flex hidden" >
          <button class="btn btn-ghost">Recipes</button>
          <button class="btn btn-ghost">Menu</button>
          <button class="btn btn-indigo">
            <router-link to="/about">Add Recipe</router-link>
          </button>
        </div>
        <Menu as="div" class="relative inline-block text-left md:hidden">
          <div>
            <MenuButton
              class="justify-center w-full px-4 py-2 font-medium rounded-md focus:outline-none focus-visible:ring-2 focus-visible:ring-white focus-visible:ring-opacity-75"
            >
              <MenuAlt3Icon class="h-10 w-10 md:hidden" />
            </MenuButton>
          </div>

          <transition
            enter-active-class="transition duration-100 ease-out"
            enter-from-class="transform scale-95 opacity-0"
            enter-to-class="transform scale-100 opacity-100"
            leave-active-class="transition duration-75 ease-in"
            leave-from-class="transform scale-100 opacity-100"
            leave-to-class="transform scale-95 opacity-0"
          >
            <MenuItems
              class="absolute right-0 w-56 mt-2 origin-top-right bg-white divide-y divide-gray-100 rounded-md shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none"
            >
              <div class="px-1 py-1">
                <MenuItem v-slot="{ active }">
                  <button
                    :class="[
                      active ? 'bg-violet-500 text-white' : 'text-gray-900',
                      'group flex rounded-md items-center w-full px-2 py-2 text-sm',
                    ]"
                  >
                    Recipes
                  </button>
                </MenuItem>
                <MenuItem v-slot="{ active }">
                  <button
                    :class="[
                      active ? 'bg-violet-500 text-white' : 'text-gray-900',
                      'group flex rounded-md items-center w-full px-2 py-2 text-sm',
                    ]"
                  >
                    Menu
                  </button>
                </MenuItem>
                <MenuItem v-slot="{ active }">
                  <button
                    :class="[
                      active ? 'bg-violet-500 text-white' : 'text-gray-900',
                      'group flex rounded-md items-center w-full px-2 py-2 text-sm',
                    ]"
                  >
                    Add recipe
                  </button>
                </MenuItem>
              </div>
              <div class="px-1 py-1">
                <MenuItem v-slot="{ active }">
                  <button
                    :class="[
                      active ? 'bg-violet-500 text-white' : 'text-gray-900',
                      'group flex rounded-md items-center w-full px-2 py-2 text-sm',
                    ]"
                  >
                    Logout
                  </button>
                </MenuItem>
              </div>
            </MenuItems>
          </transition>
        </Menu>
      </div>
    </div>
  </div>
</template>

<script>
  import { defineComponent, ref } from "vue"
  import BaseButtonVue from "./BaseButton.vue";
  import { RouterLink } from "vue-router";
  import { MenuAlt3Icon } from "@heroicons/vue/solid";
  import { Menu, MenuButton, MenuItems, MenuItem } from '@headlessui/vue'

export default defineComponent({
    components: {
      BaseButtonVue,
      RouterLink,
      MenuAlt3Icon,
      Menu,
      MenuButton,
      MenuItems,
      MenuItem
    },
  });
</script>
