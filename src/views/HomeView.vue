<template>
  <div class="container">
    <div class="card" v-for="character in characters" :key="character.id">
      <img :src="character.image" :alt="character.name" />
      <div class="card-content">
        <h2 class="card-title">{{ character.name }}</h2>
        <p class="card-description">{{ character.status }}</p>
        <router-link :to="'/character/' + character.id">
          <button>View Details</button>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'HomeView',
  data() {
    return {
      characters: [], // Массив для хранения данных о персонажах
    }
  },
  async created() {
    try {
      // Получение данных из API
      const response = await fetch('https://rickandmortyapi.com/api/character')
      const data = await response.json()
      this.characters = data.results // Заполняем массив characters данными из API
    } catch (error) {
      console.error('Error fetching characters:', error)
    }
  },
}
</script>

<style scoped>
.container {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

.card {
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  margin: 15px;
  padding: 20px;
  transition: transform 0.2s;
  max-width: 300px;
}

.card:hover {
  transform: scale(1.05);
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

button {
  background: #3b5998;
  color: #fff;
  border: none;
  border-radius: 5px;
  padding: 10px 20px;
  font-size: 1em;
  cursor: pointer;
  transition: background 0.3s;
}

button:hover {
  background: #2d4373;
}
</style>
