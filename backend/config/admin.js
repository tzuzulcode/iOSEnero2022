module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', '4256ed5d98ea21e8dd57ed40667840e7'),
  },
});
