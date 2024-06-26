import fetchWithAuth from "../utils/fetchWithAuth"; // Assurez-vous du chemin correct

const URL_API = process.env.REACT_APP_API_URL;

class EventMediaService {
  async getAllByEvent(id) {
    try {
      const response = await fetchWithAuth(
        `${URL_API}/eventmedias/event/${id}`
      );
      if (response.ok) {
        return response.json();
      } else {
        console.error("Error fetching event media", response.statusText);
        return null;
      }
    } catch (error) {
      throw error;
    }
  }

  async getAllByMedia(id) {
    try {
      const response = await fetchWithAuth(
        `${URL_API}/eventmedias/media/${id}`
      );
      if (response.ok) {
        return response.json();
      } else {
        console.error("Error fetching media by event", response.statusText);
        return null;
      }
    } catch (error) {
      throw error;
    }
  }

  async deleteAllByMedia(id) {
    try {
      const response = await fetchWithAuth(
        `${URL_API}/eventmedias/media/${id}`,
        {
          method: "DELETE",
        }
      );
      if (response.ok) {
        return true;
      } else {
        console.error("Error deleting all media", response.statusText);
        return null;
      }
    } catch (error) {
      throw error;
    }
  }

  async create(eventMedia) {
    try {
      const response = await fetchWithAuth(`${URL_API}/eventmedias`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(eventMedia),
      });
      if (response.ok) {
        return true;
      } else {
        console.error("Error creating event media", response.statusText);
        return null;
      }
    } catch (error) {
      throw error;
    }
  }
  async delete(id) {
    try {
      const response = await fetchWithAuth(
        `${URL_API}/eventmedias/media/${id}`,
        {
          method: "DELETE",
          headers: {
            "Content-Type": "application/json",
          },
        }
      );
      if (response.ok) {
        return response.status === 204;
      } else {
        console.error("Error deleting event media", response.statusText);
        return null;
      }
    } catch (error) {
      throw error;
    }
  }

  async update(updates) {
    try {
      const response = await fetchWithAuth(
        `${URL_API}/eventmedias/update-position`,
        {
          method: "PUT",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(updates),
        }
      );
      if (response.ok) {
        return true;
      } else {
        console.error("Error updating event media", response.statusText);
        return null;
      }
    } catch (error) {
      throw error;
    }
  }

  async updateDuration({ position, eventId, mediaId, duration }) {
    console.log("updateDuration", position, eventId, mediaId, duration);
    const data = {
      position,
      eventId,
      mediaId,
      duration,
    };
    try {
      const response = await fetchWithAuth(
        `${URL_API}/eventmedias/update-duration`,
        {
          method: "PUT",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(data),
        }
      );
      if (response.ok) {
        return response.json();
      } else {
        console.error("Error updating media duration", response.statusText);
        return null;
      }
    } catch (error) {
      throw error;
    }
  }
  async addPanel(eventId, media_pos_in_event) {
    try {
      const response = await fetchWithAuth(`${URL_API}/eventmedias/add-panel`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ eventId, media_pos_in_event }),
      });
      if (response.ok) {
        return "Panel added";
      } else {
        console.error("Error adding panel", response.statusText);
        return null;
      }
    } catch (error) {
      throw error;
    }
  }
}

const eventMediaService = new EventMediaService();

export default eventMediaService;
