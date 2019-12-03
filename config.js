const sourcesUrl = "hsl-map-server:8080/map/v1/";
const glyphsUrl = `file://${process.env.WORK}/node_modules/hsl-map-style/`;

module.exports = {
  "/map/v1/hsl-vector-map": {
    source: "mbtiles://./croatia.mbtiles",
    headers: {
      "Cache-Control": "public,max-age=3600"
    }
  },
  "/map/v1/hsl-map": {
    source: {
      protocol: "gl:",
      query: {},
      style: require("hsl-map-style").generateStyle({
        sourcesUrl,
        glyphsUrl
      })
    },
    headers: {
      "Cache-Control": "public,max-age=604800"
    }
  },
  "/map/v1/hsl-map-256": {
    source: {
      protocol: "gl:",
      query: { layerTileSize: 256 },
      style: require("hsl-map-style").generateStyle({
        sourcesUrl,
        glyphsUrl,
        components: { icons: { enabled: true } }
      })
    },
    headers: {
      "Cache-Control": "public,max-age=604800"
    }
  },
  "/map/v1/croatia-stop-map": {
    source: `otpstops://${process.env.WALTTI_OTP_URL}`,
    headers: {
      "Cache-Control": "public,max-age=43200"
    }
  }
};
