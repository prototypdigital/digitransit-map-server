module.exports = {
  "/map/v1/croatia-stop-map": {
    source: `otpstops://${process.env.CROATIA_OTP_URL}`,
    headers: {
      "Cache-Control": "public,max-age=43200"
    }
  }
};
