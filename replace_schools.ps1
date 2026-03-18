$file = 'index.html'
$lines = Get-Content $file -Encoding UTF8

# Find the line with "Grid 4 columnas" and the closing </section> of escuelas section
$gridStart = -1
$sectionEnd = -1

for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($gridStart -lt 0 -and $lines[$i] -match 'Grid 4 columnas') {
        $gridStart = $i
    }
    if ($gridStart -ge 0 -and $sectionEnd -lt 0 -and $i -gt $gridStart -and $lines[$i] -match '^\s*</section>') {
        $sectionEnd = $i
        break
    }
}

Write-Host "Grid starts at line $($gridStart+1), section ends at line $($sectionEnd+1)"

if ($gridStart -lt 0 -or $sectionEnd -lt 0) {
    Write-Error "Could not find markers"
    exit 1
}

$newGrid = @'
      <!-- Grid 8 escuelas -->
      <div class="grid sm:grid-cols-2 xl:grid-cols-4 gap-7">

        <!-- Ingenieria -->
        <div class="school-card bg-white rounded-2xl overflow-hidden shadow-md border border-gray-100 reveal">
          <div class="h-3 bg-gradient-to-r from-blue-700 to-blue-500"></div>
          <div class="p-6">
            <div class="w-12 h-12 rounded-xl flex items-center justify-center mb-4 bg-blue-50">
              <i class="fa-solid fa-gear text-blue-700 text-2xl"></i>
            </div>
            <h3 class="font-black text-navy text-lg mb-1">Escuela de<br />Ingenieria</h3>
            <p class="text-gray-400 text-xs mb-5">Sector industrial y energetico</p>
            <div class="flex flex-col gap-2">
              <button onclick="showProgram('sistemas')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-laptop-code mr-2 text-blue-700/70 text-xs"></i>Soporte Sistemas e Informatica</button>
              <button onclick="showProgram('oficial_construccion')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-helmet-safety mr-2 text-blue-700/70 text-xs"></i>Oficial de Construccion</button>
              <button onclick="showProgram('mecanica_diesel')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-wrench mr-2 text-blue-700/70 text-xs"></i>Mecanica de Motores Diesel</button>
              <button onclick="showProgram('telecomunicaciones')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-tower-broadcast mr-2 text-blue-700/70 text-xs"></i>Auxiliar de Telecomunicaciones</button>
              <button onclick="showProgram('operador_pozos')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-oil-well mr-2 text-blue-700/70 text-xs"></i>Operador Produccion Petroleo y Gas</button>
              <button onclick="showProgram('mecanica_industrial')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-industry mr-2 text-blue-700/70 text-xs"></i>Mecanica Industrial</button>
              <button onclick="showProgram('maquinaria_agricola')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-tractor mr-2 text-blue-700/70 text-xs"></i>Maquinaria Agricola</button>
              <button onclick="showProgram('electromecanica')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-plug mr-2 text-blue-700/70 text-xs"></i>Electromecanico</button>
              <button onclick="showProgram('soldadores')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-fire mr-2 text-blue-700/70 text-xs"></i>Soldadores</button>
              <button onclick="showProgram('perforador_pozos')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-oil-well mr-2 text-blue-700/70 text-xs"></i>Perforador de Pozos</button>
              <button onclick="showProgram('refrigeracion')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-snowflake mr-2 text-blue-700/70 text-xs"></i>Refrigeracion Comercial e Industrial</button>
              <button onclick="showProgram('electricidad')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-bolt mr-2 text-blue-700/70 text-xs"></i>Electricista Industrial</button>
              <button onclick="showProgram('electronica')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-microchip mr-2 text-blue-700/70 text-xs"></i>Aux. de Electronica</button>
            </div>
          </div>
        </div>

        <!-- Administrativa Contable -->
        <div class="school-card bg-white rounded-2xl overflow-hidden shadow-md border border-gray-100 reveal">
          <div class="h-3 bg-gradient-to-r from-purple-700 to-indigo-500"></div>
          <div class="p-6">
            <div class="w-12 h-12 rounded-xl flex items-center justify-center mb-4 bg-purple-50">
              <i class="fa-solid fa-chart-line text-purple-700 text-2xl"></i>
            </div>
            <h3 class="font-black text-navy text-lg mb-1">Escuela Administrativa<br />Contable</h3>
            <p class="text-gray-400 text-xs mb-5">Sector empresarial y financiero</p>
            <div class="flex flex-col gap-2">
              <button onclick="showProgram('mercaderista')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-store mr-2 text-purple-700/70 text-xs"></i>Mercaderista</button>
              <button onclick="showProgram('auxiliar_contable')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-calculator mr-2 text-purple-700/70 text-xs"></i>Aux. Contable de Tesoreria y Financiero</button>
              <button onclick="showProgram('auxiliar_administrativo')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-briefcase mr-2 text-purple-700/70 text-xs"></i>Auxiliar Administrativo</button>
              <button onclick="showProgram('talento_humano')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-people-group mr-2 text-purple-700/70 text-xs"></i>Auxiliar de Talento Humano</button>
              <button onclick="showProgram('almacen')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-warehouse mr-2 text-purple-700/70 text-xs"></i>Auxiliar de Almacen y Bodega</button>
              <button onclick="showProgram('archivo_registro')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-folder-open mr-2 text-purple-700/70 text-xs"></i>Auxiliar de Archivo y Registro</button>
            </div>
          </div>
        </div>

        <!-- Gastronomia -->
        <div class="school-card bg-white rounded-2xl overflow-hidden shadow-md border border-gray-100 reveal">
          <div class="h-3 bg-gradient-to-r from-red-500 to-orange-400"></div>
          <div class="p-6">
            <div class="w-12 h-12 rounded-xl flex items-center justify-center mb-4 bg-red-50">
              <i class="fa-solid fa-utensils text-red-500 text-2xl"></i>
            </div>
            <h3 class="font-black text-navy text-lg mb-1">Escuela de<br />Gastronomia</h3>
            <p class="text-gray-400 text-xs mb-5">Sector hotelero y restauracion</p>
            <div class="flex flex-col gap-2">
              <button onclick="showProgram('cocinero')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-hat-chef mr-2 text-red-500/70 text-xs"></i>Cocinero</button>
            </div>
          </div>
        </div>

        <!-- Belleza -->
        <div class="school-card bg-white rounded-2xl overflow-hidden shadow-md border border-gray-100 reveal">
          <div class="h-3 bg-gradient-to-r from-pink-400 to-fuchsia-500"></div>
          <div class="p-6">
            <div class="w-12 h-12 rounded-xl flex items-center justify-center mb-4 bg-pink-50">
              <i class="fa-solid fa-scissors text-pink-500 text-2xl"></i>
            </div>
            <h3 class="font-black text-navy text-lg mb-1">Escuela<br />de Belleza</h3>
            <p class="text-gray-400 text-xs mb-5">Sector estetica y bienestar</p>
            <div class="flex flex-col gap-2">
              <button onclick="showProgram('peluquero')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-scissors mr-2 text-pink-500/70 text-xs"></i>Peluquero Estilista</button>
            </div>
          </div>
        </div>

        <!-- Ciencias Humanas -->
        <div class="school-card bg-white rounded-2xl overflow-hidden shadow-md border border-gray-100 reveal">
          <div class="h-3 bg-gradient-to-r from-teal-500 to-cyan-500"></div>
          <div class="p-6">
            <div class="w-12 h-12 rounded-xl flex items-center justify-center mb-4 bg-teal-50">
              <i class="fa-solid fa-users text-teal-600 text-2xl"></i>
            </div>
            <h3 class="font-black text-navy text-lg mb-1">Escuela de<br />Ciencias Humanas</h3>
            <p class="text-gray-400 text-xs mb-5">Sector social y comunitario</p>
            <div class="flex flex-col gap-2">
              <button onclick="showProgram('primera_infancia')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-baby mr-2 text-teal-600/70 text-xs"></i>Asistente de Primera Infancia</button>
              <button onclick="showProgram('auxiliar_social')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-hand-holding-heart mr-2 text-teal-600/70 text-xs"></i>Auxiliar Social y Comunitario</button>
              <button onclick="showProgram('recreacion_deporte')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-futbol mr-2 text-teal-600/70 text-xs"></i>Animador, Recreacion y Deporte</button>
              <button onclick="showProgram('seguridad_ocupacional')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-shield-halved mr-2 text-teal-600/70 text-xs"></i>Aux. en Seguridad Ocupacional</button>
            </div>
          </div>
        </div>

        <!-- Salud -->
        <div class="school-card bg-white rounded-2xl overflow-hidden shadow-md border border-gray-100 reveal">
          <div class="h-3 bg-gradient-to-r from-rose-500 to-pink-500"></div>
          <div class="p-6">
            <div class="w-12 h-12 rounded-xl flex items-center justify-center mb-4 bg-rose-50">
              <i class="fa-solid fa-heart-pulse text-rose-500 text-2xl"></i>
            </div>
            <h3 class="font-black text-navy text-lg mb-1">Escuela<br />de la Salud</h3>
            <p class="text-gray-400 text-xs mb-5">Sector salud y bienestar</p>
            <div class="flex flex-col gap-2">
              <button onclick="showProgram('auxiliar_salud_admin')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-hospital mr-2 text-rose-500/70 text-xs"></i>Aux. Administrativo en Salud</button>
              <button onclick="showProgram('salud_publica')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-shield-heart mr-2 text-rose-500/70 text-xs"></i>Promotor de Salud Publica</button>
            </div>
          </div>
        </div>

        <!-- Medio Ambiente y Zootecnia -->
        <div class="school-card bg-white rounded-2xl overflow-hidden shadow-md border border-gray-100 reveal">
          <div class="h-3 bg-gradient-to-r from-green-600 to-emerald-500"></div>
          <div class="p-6">
            <div class="w-12 h-12 rounded-xl flex items-center justify-center mb-4 bg-green-50">
              <i class="fa-solid fa-leaf text-green-600 text-2xl"></i>
            </div>
            <h3 class="font-black text-navy text-lg mb-1">Escuela Medio Ambiente<br />y Zootecnia</h3>
            <p class="text-gray-400 text-xs mb-5">Sector ambiental y veterinario</p>
            <div class="flex flex-col gap-2">
              <button onclick="showProgram('saneamiento')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-recycle mr-2 text-green-600/70 text-xs"></i>Saneamiento Ambiental</button>
              <button onclick="showProgram('veterinaria')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-paw mr-2 text-green-600/70 text-xs"></i>Aux. de Clinica Veterinaria</button>
            </div>
          </div>
        </div>

        <!-- Seguridad Vial y Transporte -->
        <div class="school-card bg-white rounded-2xl overflow-hidden shadow-md border border-gray-100 reveal">
          <div class="h-3 bg-gradient-to-r from-amber-500 to-orange-500"></div>
          <div class="p-6">
            <div class="w-12 h-12 rounded-xl flex items-center justify-center mb-4 bg-amber-50">
              <i class="fa-solid fa-traffic-light text-amber-500 text-2xl"></i>
            </div>
            <h3 class="font-black text-navy text-lg mb-1">Seguridad Vial<br />y Transporte</h3>
            <p class="text-gray-400 text-xs mb-5">Sector transporte y transito</p>
            <div class="flex flex-col gap-2">
              <button onclick="showProgram('conductor_pesado')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-truck mr-2 text-amber-500/70 text-xs"></i>Conductor de Vehiculo Pesado</button>
              <button onclick="showProgram('conductor_bus')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-bus mr-2 text-amber-500/70 text-xs"></i>Conductores de Bus / Metro</button>
              <button onclick="showProgram('agente_transito')" class="program-tag text-left text-sm bg-slate-100 rounded-lg px-3 py-2 font-medium text-gray-700"><i class="fa-solid fa-shield mr-2 text-amber-500/70 text-xs"></i>Agente de Transito</button>
            </div>
          </div>
        </div>

      </div>
    </div>
  </section>
'@

# Build the new content: lines before grid + new grid + lines after section close
$before = $lines[0..($gridStart-1)]
$after = $lines[($sectionEnd+1)..($lines.Count-1)]

$combined = ($before -join "`n") + "`n" + $newGrid + "`n" + ($after -join "`n")

Set-Content $file -Value $combined -Encoding UTF8 -NoNewline
Write-Host "Done! Lines before: $($before.Count), Lines after: $($after.Count)"
