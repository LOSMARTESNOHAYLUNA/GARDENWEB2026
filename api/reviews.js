// Serverless function (Vercel) — devuelve las últimas reseñas de Google
// Requiere variables de entorno en Vercel:
//   GOOGLE_PLACES_API_KEY  -> clave de API de Google (Places API habilitada)
//   GOOGLE_PLACE_ID        -> Place ID de la ficha de Garden Solution
// Uso: /api/reviews?lang=es  (es | en | de)

module.exports = async (req, res) => {
  var key = process.env.GOOGLE_PLACES_API_KEY;
  // Place ID de Garden Solution Mallorca SL (público, no es secreto)
  var placeId = process.env.GOOGLE_PLACE_ID || 'ChIJxdJLNgaPwk4RYxbOROBK_fo';
  var lang = String((req.query && req.query.lang) || 'es').slice(0, 2).toLowerCase();
  if (['es', 'en', 'de'].indexOf(lang) === -1) lang = 'es';

  if (!key || !placeId) {
    res.status(500).json({ error: 'missing_config' });
    return;
  }

  var url = 'https://maps.googleapis.com/maps/api/place/details/json'
    + '?place_id=' + encodeURIComponent(placeId)
    + '&fields=rating,user_ratings_total,reviews'
    + '&reviews_sort=newest'
    + '&language=' + encodeURIComponent(lang)
    + '&key=' + encodeURIComponent(key);

  try {
    var r = await fetch(url);
    var data = await r.json();
    var result = data.result || {};
    var reviews = (result.reviews || [])
      .filter(function (rv) { return rv.rating >= 4; })
      .slice(0, 5)
      .map(function (rv) {
        return {
          author: rv.author_name || '',
          rating: rv.rating || 5,
          text: rv.text || '',
          time: rv.relative_time_description || '',
          photo: rv.profile_photo_url || ''
        };
      });

    // Cache en el edge de Vercel: 1 llamada/día como máximo a Google (coste ~0)
    res.setHeader('Cache-Control', 'public, s-maxage=86400, stale-while-revalidate=43200');
    res.status(200).json({
      rating: result.rating || null,
      total: result.user_ratings_total || null,
      reviews: reviews
    });
  } catch (e) {
    res.status(500).json({ error: 'fetch_failed' });
  }
};
