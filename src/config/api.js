/**
 * API Configuration
 * Base URL is loaded from environment variables
 * All endpoint functions are defined here for centralized management
 */

const BASE_URL = process.env.REACT_APP_API_BASE_URL || 'http://localhost:4000';

// API Endpoints
export const endpoints = {
    // Admin Authentication
    admin: () => `${BASE_URL}/api/admin`,
    adminLogin: () => `${BASE_URL}/api/admin/login`,
    adminChangePassword: () => `${BASE_URL}/api/admin/change-password`,

    // Blog Endpoints
    blogs: () => `${BASE_URL}/website/admin/blogs`,
    blogById: (id) => `${BASE_URL}/website/admin/blogs/${id}`,

    // FAQ Endpoints
    faqs: () => `${BASE_URL}/website/admin/faqs`,
    faqById: (id) => `${BASE_URL}/website/admin/faqs/${id}`,
    faqReaction: (id) => `${BASE_URL}/website/admin/faqs/${id}/reaction`,
};

export default endpoints;

