<template>
  <div class="character-card">
    <img :src="character.image" alt="Character image" />
    <h2>{{ character.name }}</h2>
    <p>{{ character.species }}</p>
    <router-link :to="{ name: 'CharacterDetail', params: { id: character.id } }"
      >View Details</router-link
    >
  </div>
</template>

<script>
export default {
  name: 'CharacterCard',
  props: {
    character: Object,
  },
}
</script>

<style scoped>
.character-card {
  border: 1px solid #ccc;
  border-radius: 8px;
  padding: 16px;
  margin: 8px;
  text-align: center;
}
img {
  width: 100px;
  height: 100px;
  border-radius: 50%;
}
</style>
