<template>
  <div class="container" v-if="character">
    <div class="card">
      <img :src="character.image" :alt="character.name" />
      <div class="card-content">
        <h2 class="card-title">{{ character.name }}</h2>
        <p class="card-description">Status: {{ character.status }}</p>
        <p class="card-description">Species: {{ character.species }}</p>
        <p class="card-description">Gender: {{ character.gender }}</p>
        <p class="card-description">
          Location:
          {{ character.location ? character.location.name : 'Unknown' }}
        </p>
      </div>
    </div>
  </div>
  <div v-else>
    <p>Loading...</p>
  </div>
</template>

<script>
export default {
  name: 'CharacterDetail',
  data() {
    return {
      character: null, // Используйте null вместо объекта для обозначения отсутствия данных
    }
  },
  async created() {
    try {
      const id = this.$route.params.id // Получаем ID из параметров маршрута
      const response = await fetch(
        `https://rickandmortyapi.com/api/character/${id}`
      )
      const data = await response.json()
      this.character = data // Заполняем объект character данными из API
    } catch (error) {
      console.error('Error fetching character:', error)
    }
  },
}
</script>

<style scoped>
.container {
  display: flex;
  justify-content: center;
}

.card {
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  padding: 20px;
  max-width: 600px;
}

.card img {
  max-width: 100%;
  border-radius: 8px;
}

.card-content {
  margin-top: 15px;
}

.card-title {
  font-size: 1.5em;
  margin: 0;
}

.card-description {
  color: #555;
  font-size: 1em;
  line-height: 1.6;
}
</style>
