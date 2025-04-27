// Wait for the DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    // Variables
    const navbar = document.querySelector('.navbar');
    const navToggle = document.getElementById('navToggle');
    const navMenu = document.getElementById('navMenu');
    const testimonialSlides = document.querySelectorAll('.testimonial-slide');
    const prevTestimonialBtn = document.getElementById('prevTestimonial');
    const nextTestimonialBtn = document.getElementById('nextTestimonial');
    const indicators = document.querySelectorAll('.indicator');
    let currentTestimonial = 0;
    let testimonialInterval;

    // Navbar scroll effect
    function handleScroll() {
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    }

    // Toggle mobile navigation
    function toggleNav() {
        navMenu.classList.toggle('active');
        navToggle.classList.toggle('active');
    }

    // Smooth scroll for anchor links
    function smoothScroll(e) {
        if (this.hash !== '') {
            e.preventDefault();
            const hash = this.hash;
            const target = document.querySelector(hash);
            
            if (target) {
                // Close mobile menu if open
                navMenu.classList.remove('active');
                navToggle.classList.remove('active');
                
                window.scrollTo({
                    top: target.offsetTop - 70,
                    behavior: 'smooth'
                });
            }
        }
    }

    // Testimonial Slider
    function showTestimonial(n) {
        // Reset current testimonial
        testimonialSlides[currentTestimonial].classList.remove('active');
        indicators[currentTestimonial].classList.remove('active');
        
        // Update current testimonial
        currentTestimonial = (n + testimonialSlides.length) % testimonialSlides.length;
        
        // Show new testimonial
        testimonialSlides[currentTestimonial].classList.add('active');
        indicators[currentTestimonial].classList.add('active');
    }

    function nextTestimonial() {
        showTestimonial(currentTestimonial + 1);
        resetTestimonialInterval();
    }

    function prevTestimonial() {
        showTestimonial(currentTestimonial - 1);
        resetTestimonialInterval();
    }

    function resetTestimonialInterval() {
        clearInterval(testimonialInterval);
        startTestimonialInterval();
    }

    function startTestimonialInterval() {
        testimonialInterval = setInterval(nextTestimonial, 5000);
    }

    // Initialize testimonial auto-rotation
    function initTestimonials() {
        if (testimonialSlides.length > 0) {
            startTestimonialInterval();
        }
    }

    // Handle form submission
    function handleFormSubmit(e) {
        e.preventDefault();
        
        // Get form data
        const name = document.getElementById('name').value;
        const email = document.getElementById('email').value;
        const phone = document.getElementById('phone').value;
        const service = document.getElementById('service').value;
        const message = document.getElementById('message').value;
        
        // In a real scenario, you would send this data to a server
        console.log('Form submitted:', { name, email, phone, service, message });
        
        // Show success message
        alert('Thank you for your message. Our team will contact you shortly.');
        
        // Reset form
        e.target.reset();
    }

    // Active navigation based on scroll position
    function highlightNavigation() {
        const sections = document.querySelectorAll('section');
        const navLinks = document.querySelectorAll('.nav-menu > li > a:not(.btn)');
        
        let currentSection = '';
        
        sections.forEach(section => {
            const sectionTop = section.offsetTop - 100;
            const sectionHeight = section.offsetHeight;
            
            if (window.scrollY >= sectionTop && window.scrollY < sectionTop + sectionHeight) {
                currentSection = section.getAttribute('id');
            }
        });
        
        navLinks.forEach(link => {
            link.classList.remove('active');
            if (link.getAttribute('href') === `#${currentSection}`) {
                link.classList.add('active');
            }
        });
    }

    // Animations on scroll
    function animateOnScroll() {
        const elements = document.querySelectorAll('.service-card, .about-image, .about-text, .careers-image, .careers-text, .contact-info, .contact-form');
        
        elements.forEach(element => {
            const elementPosition = element.getBoundingClientRect().top;
            const screenPosition = window.innerHeight / 1.3;
            
            if (elementPosition < screenPosition) {
                element.classList.add('animate');
            }
        });
    }

    // Event Listeners
    window.addEventListener('scroll', handleScroll);
    window.addEventListener('scroll', highlightNavigation);
    window.addEventListener('scroll', animateOnScroll);
    
    navToggle.addEventListener('click', toggleNav);
    
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', smoothScroll);
    });
    
    if (prevTestimonialBtn && nextTestimonialBtn) {
        prevTestimonialBtn.addEventListener('click', prevTestimonial);
        nextTestimonialBtn.addEventListener('click', nextTestimonial);
    }
    
    if (indicators.length > 0) {
        indicators.forEach((indicator, index) => {
            indicator.addEventListener('click', () => {
                showTestimonial(index);
                resetTestimonialInterval();
            });
        });
    }
    
    const consultationForm = document.getElementById('consultationForm');
    if (consultationForm) {
        consultationForm.addEventListener('submit', handleFormSubmit);
    }

    // Initialize
    handleScroll();
    highlightNavigation();
    initTestimonials();
    
    // Add animation class to service cards with delay
    const serviceCards = document.querySelectorAll('.service-card');
    serviceCards.forEach((card, index) => {
        setTimeout(() => {
            card.classList.add('animate');
        }, 200 * index);
    });

    // Handle dropdown menus on mobile
    const dropdowns = document.querySelectorAll('.dropdown');
    dropdowns.forEach(dropdown => {
        const link = dropdown.querySelector('a');
        const menu = dropdown.querySelector('.dropdown-menu');
        
        link.addEventListener('click', function(e) {
            if (window.innerWidth <= 768) {
                e.preventDefault();
                menu.classList.toggle('active');
            }
        });
    });
}); 