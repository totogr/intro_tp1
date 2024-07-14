document.addEventListener('DOMContentLoaded', function () {
    const params = new URLSearchParams(window.location.search);
    const liga = params.get('liga');

    const equiposInfo = {
        argentina: [
            { nombre: 'River Plate', logo: '../logos/river.jpg' },
            { nombre: 'Boca Juniors', logo: '../logos/boca.jpg' },
            { nombre: 'Independiente', logo: '../logos/independiente.jpg' },
            { nombre: 'Racing Club', logo: '../logos/racing.jpg' },
            { nombre: 'San Lorenzo', logo: '../logos/sanlorenzo.jpg' }
        ],
        alemania: [
            { nombre: 'Bayern Munich', logo: '../logos/bayern.jpg' },
            { nombre: 'Borussia Dortmund', logo: '../logos/dortmund.jpg' },
            { nombre: 'Borussia Monchengladbach', logo: '../logos/monchengladbach.jpg' },
            { nombre: 'Bayer Leverkusen', logo: '../logos/leverkusen.jpg' },
            { nombre: 'Schalke 04', logo: '../logos/schalke.jpg' }
        ],
        inglaterra: [
            { nombre: 'Manchester United', logo: '../logos/united.jpg' },
            { nombre: 'Manchester City', logo: '../logos/city.jpg' },
            { nombre: 'Liverpool', logo: '../logos/liverpool.jpg' },
            { nombre: 'Chelsea', logo: '../logos/chelsea.jpg' },
            { nombre: 'Arsenal', logo: '../logos/arsenal.jpg' }
        ],
        italia: [
            { nombre: 'Juventus', logo: '../logos/juventus.jpg' },
            { nombre: 'Inter de Milán', logo: '../logos/inter.jpg' },
            { nombre: 'AC Milan', logo: '../logos/milan.jpg' },
            { nombre: 'Roma', logo: '../logos/roma.jpg' },
            { nombre: 'Napoli', logo: '../logos/napoli.jpg' }
        ],
        espania: [
            { nombre: 'FC Barcelona', logo: '../logos/barcelona.jpg' },
            { nombre: 'Real Madrid', logo: '../logos/realmadrid.jpg' },
            { nombre: 'Atlético de Madrid', logo: '../logos/atletico.jpg' },
            { nombre: 'Sevilla FC', logo: '../logos/sevilla.jpg' },
            { nombre: 'Athletic Club', logo: '../logos/athletic.jpg' }
        ]
    };

    if (equiposInfo[liga]) {
        const equiposList = document.getElementById('equipos-list');
        equiposList.innerHTML = ''; // Limpiamos la lista por si había elementos previos

        equiposInfo[liga].forEach(equipo => {
            const li = document.createElement('li');
            li.className = 'equipo-card';
            const a = document.createElement('a');
            a.href = 'equipo.html?equipo=' + encodeURIComponent(equipo.nombre.toLowerCase().replace(/ /g, ''));
            a.className = 'card';
            const img = document.createElement('img');
            img.className = 'card-img-top';
            img.src = equipo.logo;
            img.alt = 'Logo de ' + equipo.nombre;
            img.width = 50;
            const div = document.createElement('div');
            div.className = 'card-body';
            const h3 = document.createElement('h3');
            h3.className = 'card-text';
            h3.textContent = equipo.nombre;

            div.appendChild(h3);
            a.appendChild(img);
            a.appendChild(div);
            li.appendChild(a);
            equiposList.appendChild(li);
        });

        // Actualizamos el título de la página con el nombre de la liga y el país
        if (liga === 'espania') {
            document.getElementById('liga-nombre').textContent = 'Liga de España';
        } else {
            document.getElementById('liga-nombre').textContent = 'Liga de ' + liga.charAt(0).toUpperCase() + liga.slice(1);
        }
    } else {
        document.getElementById('liga-nombre').textContent = 'Liga no encontrada';
    }
});
